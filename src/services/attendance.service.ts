import { supabase } from '@/lib/supabase'
import { DemoStore } from './demo-store'
import type { Attendance, AttendanceMethod, QrScanResult } from '@/types'
import { parseQrPayload } from '@/utils/qr'
import { createNotification } from './notifications.service'

function normalizeToken(raw: string) {
  const parsed = parseQrPayload(raw.trim())
  if (parsed) return parsed
  // Allow pasting token without prefix (non-hex edge cases)
  const trimmed = raw.trim()
  if (trimmed.startsWith('eventtrack:reg:')) {
    return trimmed.slice('eventtrack:reg:'.length).trim()
  }
  return trimmed
}

function normalizeScanResult(row: unknown): QrScanResult {
  const data = row as Record<string, unknown>

  return {
    registration_id: String(data.registration_id),
    qr_token: String(data.qr_token),
    registration_status: data.registration_status as QrScanResult['registration_status'],
    event:
      typeof data.event === 'string'
        ? (JSON.parse(data.event) as QrScanResult['event'])
        : (data.event as QrScanResult['event']),
    participant:
      typeof data.participant === 'string'
        ? (JSON.parse(data.participant) as QrScanResult['participant'])
        : (data.participant as QrScanResult['participant']),
    attendance:
      data.attendance == null
        ? null
        : typeof data.attendance === 'string'
          ? (JSON.parse(data.attendance) as NonNullable<QrScanResult['attendance']>)
          : (data.attendance as NonNullable<QrScanResult['attendance']>),
  }
}

/**
 * Lookup participant + event details from an opaque QR registration token.
 * Personal data is NEVER stored inside the QR — only the token is.
 */
export async function lookupByQrToken(rawToken: string): Promise<QrScanResult> {
  const token = normalizeToken(rawToken)
  if (!token) throw new Error('Invalid QR token')

  try {
    const { data, error } = await supabase.rpc('lookup_registration_by_qr', {
      p_qr_token: token,
    })

    if (!error && data) {
      const row = Array.isArray(data) ? data[0] : data
      if (row) return normalizeScanResult(row)
    }
  } catch {}

  const demoResult = DemoStore.getRegistrationByQrToken(token)
  if (demoResult) return demoResult

  throw new Error('Registration not found for this QR code')
}

/**
 * Mark attendance for a registration QR token.
 * Duplicate check-ins are blocked by UNIQUE(registration_id) + RPC guard.
 */
export async function markAttendanceByQr(
  rawToken: string,
  method: AttendanceMethod = 'qr_scan',
): Promise<Attendance> {
  const token = normalizeToken(rawToken)
  if (!token) throw new Error('Invalid QR token')

  try {
    const { data, error } = await supabase.rpc('mark_attendance', {
      p_qr_token: token,
      p_method: method,
    })

    if (!error && data) {
      const attendanceRecord = data as Attendance
      if (attendanceRecord?.participant_id) {
        createNotification({
          user_id: attendanceRecord.participant_id,
          title: 'Attendance Verified! ✅',
          message: 'Your check-in has been successfully recorded. You can now view and download your Certificate of Participation.',
          type: 'success',
        }).catch(() => {})
      }
      return attendanceRecord
    }
  } catch {}

  // Fallback to DemoStore
  const demoAtt = DemoStore.markAttendanceByQr(token, 'volunteer_demo_id')
  if (demoAtt?.participant_id) {
    createNotification({
      user_id: demoAtt.participant_id,
      title: 'Attendance Verified! ✅',
      message: 'Your check-in has been successfully recorded. You can now view and download your Certificate of Participation.',
      type: 'success',
    }).catch(() => {})
  }
  return demoAtt
}

export async function listEventAttendance(eventId: string) {
  try {
    const { data, error } = await supabase
      .from('attendance')
      .select('*, users!attendance_participant_id_fkey(*), registrations(*)')
      .eq('event_id', eventId)
      .order('checked_in_at', { ascending: false })

    if (!error && data && data.length > 0) {
      return data
    }
  } catch {}

  const allAtt = DemoStore.getAttendance().filter((a) => a.event_id === eventId)
  return allAtt.map((a) => ({
    ...a,
    users: DemoStore.findUserById(a.participant_id),
    registrations: DemoStore.getRegistrationById(a.registration_id),
  }))
}

export async function getAttendanceStats(eventId: string) {
  try {
    const [registrations, attendance] = await Promise.all([
      supabase
        .from('registrations')
        .select('id', { count: 'exact', head: true })
        .eq('event_id', eventId)
        .neq('status', 'cancelled'),
      supabase
        .from('attendance')
        .select('id', { count: 'exact', head: true })
        .eq('event_id', eventId),
    ])

    if (!registrations.error && !attendance.error && registrations.count !== null) {
      const registered = registrations.count ?? 0
      const checkedIn = attendance.count ?? 0
      return {
        registered,
        checkedIn,
        pending: Math.max(registered - checkedIn, 0),
        checkInRate: registered === 0 ? 0 : checkedIn / registered,
      }
    }
  } catch {}

  const regs = DemoStore.getRegistrations().filter((r) => r.event_id === eventId)
  const atts = DemoStore.getAttendance().filter((a) => a.event_id === eventId)
  const registered = regs.length
  const checkedIn = atts.length

  return {
    registered,
    checkedIn,
    pending: Math.max(registered - checkedIn, 0),
    checkInRate: registered === 0 ? 0 : checkedIn / registered,
  }
}

export async function listRecentCheckInsByVolunteer(
  volunteerId: string,
  limit = 10,
) {
  try {
    const { data, error } = await supabase
      .from('attendance')
      .select(
        '*, users!attendance_participant_id_fkey(full_name, usn, email), events(title)',
      )
      .eq('checked_in_by', volunteerId)
      .order('checked_in_at', { ascending: false })
      .limit(limit)

    if (!error && data && data.length > 0) {
      return data
    }
  } catch {}

  const atts = DemoStore.getAttendance().slice(0, limit)
  return atts.map((a) => {
    const u = DemoStore.findUserById(a.participant_id)
    const ev = DemoStore.getEventById(a.event_id)
    return {
      ...a,
      users: u ? { full_name: u.full_name, usn: u.usn, email: u.email } : null,
      events: ev ? { title: ev.title } : null,
    }
  })
}

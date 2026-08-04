import demoData from '@/data/demo-dataset.json'
import type { User, Event, RegistrationWithEvent, Attendance, QrScanResult } from '@/types'

const STORAGE_KEY = 'eventtrack_demo_state_v1'

type DemoStoreState = {
  users: User[]
  events: Event[]
  registrations: any[]
  attendance: Attendance[]
  event_volunteers?: any[]
}

function loadState(): DemoStoreState {
  try {
    const saved = localStorage.getItem(STORAGE_KEY)
    if (saved) {
      const parsed = JSON.parse(saved)
      return {
        event_volunteers: [],
        ...parsed,
      }
    }
  } catch (err) {
    console.warn('Failed to read localStorage demo state:', err)
  }
  return {
    event_volunteers: [],
    ...(demoData as any),
  } as DemoStoreState
}

function saveState(state: DemoStoreState) {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state))
  } catch (err) {
    console.warn('Failed to save demo state:', err)
  }
}

let storeState = loadState()

export const DemoStore = {
  getUsers(): User[] {
    return storeState.users
  },

  findUserByEmail(email: string): User | undefined {
    const normalized = email.trim().toLowerCase()
    return storeState.users.find((u) => u.email.toLowerCase() === normalized)
  },

  findUserById(id: string): User | undefined {
    return storeState.users.find((u) => u.id === id)
  },

  getEvents(): Event[] {
    return storeState.events
  },

  getEventById(eventId: string): Event | undefined {
    return storeState.events.find((e) => e.id === eventId || (e as any).legacy_id === eventId)
  },

  getRegistrations(): any[] {
    return storeState.registrations
  },

  getVolunteersForEvent(eventId: string): any[] {
    const list = storeState.event_volunteers ?? []
    return list.filter((v) => v.event_id === eventId)
  },

  assignVolunteer(assignedRow: any): any {
    if (!storeState.event_volunteers) {
      storeState.event_volunteers = []
    }
    const exists = storeState.event_volunteers.some(
      (v) => v.event_id === assignedRow.event_id && v.volunteer_id === assignedRow.volunteer_id,
    )
    if (exists) {
      throw new Error('Duplicate assignment: Volunteer is already assigned')
    }
    storeState.event_volunteers.unshift(assignedRow)
    saveState(storeState)
    return assignedRow
  },

  removeVolunteer(assignmentId: string): void {
    if (!storeState.event_volunteers) return
    storeState.event_volunteers = storeState.event_volunteers.filter(
      (v) => v.id !== assignmentId,
    )
    saveState(storeState)
  },

  getRegistrationsForUser(userId: string): RegistrationWithEvent[] {
    return storeState.registrations
      .filter((r) => r.participant_id === userId)
      .map((r) => {
        const ev = this.getEventById(r.event_id)
        return {
          ...r,
          events: ev,
        }
      })
  },

  getRegistrationById(regId: string): RegistrationWithEvent | undefined {
    const reg = storeState.registrations.find(
      (r) => r.id === regId || r.legacy_id === regId,
    )
    if (!reg) return undefined
    const ev = this.getEventById(reg.event_id)
    return {
      ...reg,
      events: ev,
    }
  },

  getRegistrationByQrToken(qrToken: string): QrScanResult | undefined {
    const trimmed = qrToken.trim()
    const reg = storeState.registrations.find(
      (r) =>
        r.qr_token === trimmed ||
        r.id === trimmed ||
        r.legacy_id === trimmed ||
        trimmed.includes(r.legacy_id),
    )
    if (!reg) return undefined

    const ev = this.getEventById(reg.event_id)
    const user = this.findUserById(reg.participant_id)
    const att = storeState.attendance.find((a) => a.registration_id === reg.id)

    if (!ev || !user) return undefined

    return {
      registration_id: reg.id,
      qr_token: reg.qr_token,
      registration_status: reg.status,
      event: {
        id: ev.id,
        title: ev.title,
        start_time: ev.start_time,
        end_time: ev.end_time,
        location: ev.location,
      },
      participant: {
        id: user.id,
        full_name: user.full_name,
        usn: user.usn,
        email: user.email,
        branch: user.branch,
        avatar_url: user.avatar_url,
      },
      attendance: att
        ? {
            id: att.id,
            checked_in_at: att.checked_in_at,
            method: att.method,
          }
        : null,
    }
  },

  markAttendanceByQr(qrToken: string, volunteerId: string): Attendance {
    const result = this.getRegistrationByQrToken(qrToken)
    if (!result) {
      throw new Error('Registration not found for this QR code token')
    }

    const existingAtt = storeState.attendance.find(
      (a) => a.registration_id === result.registration_id,
    )
    if (existingAtt) {
      throw new Error('Already checked in for this event')
    }

    const now = new Date().toISOString()
    const newAtt: Attendance = {
      id: `att_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`,
      registration_id: result.registration_id,
      event_id: result.event.id,
      participant_id: result.participant.id,
      checked_in_by: volunteerId,
      checked_in_at: now,
      method: 'qr_scan',
    }

    // Update status in registration
    storeState.registrations = storeState.registrations.map((r) =>
      r.id === result.registration_id ? { ...r, status: 'checked_in' } : r,
    )

    storeState.attendance.push(newAtt)
    saveState(storeState)
    return newAtt
  },

  getAttendance(): Attendance[] {
    return storeState.attendance
  },
}


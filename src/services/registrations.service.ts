import { supabase } from '@/lib/supabase'
import { DemoStore } from './demo-store'
import type { Registration, RegistrationWithEvent } from '@/types'
import { createNotification } from './notifications.service'

export type RegistrationQrFields = Registration & {
  qr_version?: number
  qr_rotated_at?: string | null
}

export async function registerForEvent(eventId: string, participantId: string) {
  try {
    const { data, error } = await supabase
      .from('registrations')
      .insert({
        event_id: eventId,
        participant_id: participantId,
      })
      .select()
      .single()

    if (!error && data) {
      createNotification({
        user_id: participantId,
        title: 'Event Registration Confirmed! 🎉',
        message: 'Your ticket and unique check-in QR code are now available in My Registrations.',
        type: 'event',
      }).catch(() => {})
      return data as Registration
    }
  } catch {}

  // Local state fallback
  const ev = DemoStore.getEventById(eventId)
  const user = DemoStore.findUserById(participantId)
  const newReg = {
    id: `reg_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`,
    event_id: eventId,
    participant_id: participantId,
    qr_token: `eventtrack_qr_${Date.now()}_${participantId}`,
    qr_version: 1,
    status: 'registered' as const,
    registered_at: new Date().toISOString(),
    cancelled_at: null,
    events: ev,
    users: user,
  }
  DemoStore.getRegistrations().unshift(newReg)
  return newReg as unknown as Registration
}

export async function getRegistrationById(registrationId: string) {
  try {
    const { data, error } = await supabase
      .from('registrations')
      .select('*, events(*)')
      .eq('id', registrationId)
      .single()

    if (!error && data) {
      return data as RegistrationWithEvent
    }
  } catch {}

  const found = DemoStore.getRegistrationById(registrationId)
  if (found) return found
  throw new Error('Registration not found')
}

export async function getMyRegistrationForEvent(
  eventId: string,
  participantId: string,
) {
  try {
    const { data, error } = await supabase
      .from('registrations')
      .select('*, events(*)')
      .eq('event_id', eventId)
      .eq('participant_id', participantId)
      .neq('status', 'cancelled')
      .maybeSingle()

    if (!error && data) {
      return data as RegistrationWithEvent
    }
  } catch {}

  const regs = DemoStore.getRegistrationsForUser(participantId)
  return regs.find((r) => r.event_id === eventId || (r.events as any)?.legacy_id === eventId) ?? null
}

export async function listParticipantRegistrations(participantId: string) {
  try {
    const { data, error } = await supabase
      .from('registrations')
      .select('*, events(*)')
      .eq('participant_id', participantId)
      .neq('status', 'cancelled')
      .order('registered_at', { ascending: false })

    if (!error && data && data.length > 0) {
      return data as RegistrationWithEvent[]
    }
  } catch {}

  return DemoStore.getRegistrationsForUser(participantId)
}

export async function listEventRegistrations(eventId: string) {
  try {
    const { data, error } = await supabase
      .from('registrations')
      .select('*, users(*)')
      .eq('event_id', eventId)
      .order('registered_at', { ascending: false })

    if (!error && data && data.length > 0) {
      return data
    }
  } catch {}

  const regs = DemoStore.getRegistrations().filter((r) => r.event_id === eventId)
  return regs.map((r) => ({
    ...r,
    users: DemoStore.findUserById(r.participant_id),
  }))
}

export async function cancelRegistration(registrationId: string) {
  const { data, error } = await supabase
    .from('registrations')
    .update({
      status: 'cancelled',
      cancelled_at: new Date().toISOString(),
    })
    .eq('id', registrationId)
    .select()
    .single()

  if (error) throw error
  return data as Registration
}

/** Fetch only the opaque QR token for a registration owned by the participant */
export async function getRegistrationQrToken(registrationId: string) {
  try {
    const { data, error } = await supabase
      .from('registrations')
      .select('id, qr_token, status, event_id, qr_version, qr_rotated_at')
      .eq('id', registrationId)
      .single()

    if (!error && data) {
      return data as Pick<
        RegistrationQrFields,
        'id' | 'qr_token' | 'status' | 'event_id' | 'qr_version' | 'qr_rotated_at'
      >
    }
  } catch {}

  const reg = DemoStore.getRegistrationById(registrationId)
  if (!reg) throw new Error('Registration not found')
  return {
    id: reg.id,
    qr_token: reg.qr_token,
    status: reg.status,
    event_id: reg.event_id,
    qr_version: reg.qr_version ?? 1,
    qr_rotated_at: reg.qr_rotated_at ?? null,
  }
}

/**
 * Dynamically regenerate the registration QR token.
 * Old QR codes stop working after this call.
 */
export async function regenerateRegistrationQr(registrationId: string) {
  const { data, error } = await supabase.rpc('regenerate_registration_qr', {
    p_registration_id: registrationId,
  })

  if (error) throw error
  return data as RegistrationQrFields
}

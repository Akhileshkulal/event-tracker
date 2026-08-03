import { supabase } from '@/lib/supabase'
import type { Registration, RegistrationWithEvent } from '@/types'

export async function registerForEvent(eventId: string, participantId: string) {
  const { data, error } = await supabase
    .from('registrations')
    .insert({
      event_id: eventId,
      participant_id: participantId,
    })
    .select()
    .single()

  if (error) throw error
  return data as Registration
}

export async function getRegistrationById(registrationId: string) {
  const { data, error } = await supabase
    .from('registrations')
    .select('*, events(*)')
    .eq('id', registrationId)
    .single()

  if (error) throw error
  return data as RegistrationWithEvent
}

export async function getMyRegistrationForEvent(
  eventId: string,
  participantId: string,
) {
  const { data, error } = await supabase
    .from('registrations')
    .select('*, events(*)')
    .eq('event_id', eventId)
    .eq('participant_id', participantId)
    .neq('status', 'cancelled')
    .maybeSingle()

  if (error) throw error
  return data as RegistrationWithEvent | null
}

export async function listParticipantRegistrations(participantId: string) {
  const { data, error } = await supabase
    .from('registrations')
    .select('*, events(*)')
    .eq('participant_id', participantId)
    .neq('status', 'cancelled')
    .order('registered_at', { ascending: false })

  if (error) throw error
  return data as RegistrationWithEvent[]
}

export async function listEventRegistrations(eventId: string) {
  const { data, error } = await supabase
    .from('registrations')
    .select('*, users(*)')
    .eq('event_id', eventId)
    .order('registered_at', { ascending: false })

  if (error) throw error
  return data
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
  const { data, error } = await supabase
    .from('registrations')
    .select('id, qr_token, status, event_id')
    .eq('id', registrationId)
    .single()

  if (error) throw error
  return data as Pick<
    Registration,
    'id' | 'qr_token' | 'status' | 'event_id'
  >
}

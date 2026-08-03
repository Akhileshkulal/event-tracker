import { supabase } from '@/lib/supabase'
import type { Event, EventVolunteer, User } from '@/types'

export type EventVolunteerRow = EventVolunteer & {
  users: Pick<User, 'id' | 'full_name' | 'email' | 'role'> | null
}

export type VolunteerEventRow = EventVolunteer & {
  events: Event | null
}

export async function listEventVolunteers(eventId: string) {
  const { data, error } = await supabase
    .from('event_volunteers')
    .select('*, users(id, full_name, email, role)')
    .eq('event_id', eventId)
    .order('assigned_at', { ascending: false })

  if (error) throw error
  return data as EventVolunteerRow[]
}

export async function listVolunteerEvents(volunteerId: string) {
  const { data, error } = await supabase
    .from('event_volunteers')
    .select('*, events(*)')
    .eq('volunteer_id', volunteerId)
    .order('assigned_at', { ascending: false })

  if (error) throw error
  return data as VolunteerEventRow[]
}

export async function assignVolunteerToEvent(input: {
  event_id: string
  volunteer_id: string
  assigned_by: string
}) {
  const { data, error } = await supabase
    .from('event_volunteers')
    .insert(input)
    .select('*, users(id, full_name, email, role)')
    .single()

  if (error) throw error
  return data as EventVolunteerRow
}

export async function removeVolunteerFromEvent(assignmentId: string) {
  const { error } = await supabase
    .from('event_volunteers')
    .delete()
    .eq('id', assignmentId)

  if (error) throw error
}

export async function searchVolunteers(query: string) {
  const q = query.trim()
  if (!q) return [] as User[]

  const { data, error } = await supabase
    .from('users')
    .select('*')
    .eq('role', 'volunteer')
    .or(`full_name.ilike.%${q}%,email.ilike.%${q}%`)
    .limit(8)

  if (error) throw error
  return data as User[]
}

export async function listCheckInEvents() {
  const { data, error } = await supabase
    .from('events')
    .select('*')
    .in('status', ['published', 'ongoing', 'completed'])
    .order('start_time', { ascending: true })

  if (error) throw error
  return data as Event[]
}

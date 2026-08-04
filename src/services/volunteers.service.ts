import { supabase } from '@/lib/supabase'
import { DemoStore } from './demo-store'
import type { Event, EventVolunteer, User } from '@/types'

export type EventVolunteerRow = EventVolunteer & {
  users: Pick<User, 'id' | 'full_name' | 'email' | 'role'> | null
}

export type VolunteerEventRow = EventVolunteer & {
  events: Event | null
}

export async function listEventVolunteers(eventId: string) {
  try {
    const { data, error } = await supabase
      .from('event_volunteers')
      .select('*, users(id, full_name, email, role)')
      .eq('event_id', eventId)
      .order('assigned_at', { ascending: false })

    if (!error && data) {
      return data as EventVolunteerRow[]
    }
  } catch {}
  return DemoStore.getVolunteersForEvent(eventId) as EventVolunteerRow[]
}

export async function listVolunteerEvents(volunteerId: string) {
  try {
    const { data, error } = await supabase
      .from('event_volunteers')
      .select('*, events(*)')
      .eq('volunteer_id', volunteerId)
      .order('assigned_at', { ascending: false })

    if (!error && data && data.length > 0) {
      return data as VolunteerEventRow[]
    }
  } catch {}

  const allEvents = DemoStore.getEvents()
  return allEvents.map((e) => ({
    id: `ev_reg_${e.id}`,
    event_id: e.id,
    volunteer_id: volunteerId,
    assigned_by: null,
    assigned_at: e.created_at,
    events: e,
  })) as VolunteerEventRow[]
}

export async function assignVolunteerToEvent(input: {
  event_id: string
  volunteer_id: string
  assigned_by: string
}) {
  try {
    const { data, error } = await supabase
      .from('event_volunteers')
      .insert(input)
      .select('*, users(id, full_name, email, role)')
      .single()

    if (!error && data) {
      return data as EventVolunteerRow
    }
  } catch {}

  const vUser = DemoStore.findUserById(input.volunteer_id)
  const newRow: EventVolunteerRow = {
    id: `ev_assign_${Date.now()}`,
    event_id: input.event_id,
    volunteer_id: input.volunteer_id,
    assigned_by: input.assigned_by,
    assigned_at: new Date().toISOString(),
    users: vUser
      ? {
          id: vUser.id,
          full_name: vUser.full_name,
          email: vUser.email,
          role: vUser.role,
        }
      : null,
  }
  return DemoStore.assignVolunteer(newRow) as EventVolunteerRow
}

export async function removeVolunteerFromEvent(assignmentId: string) {
  try {
    const { error } = await supabase
      .from('event_volunteers')
      .delete()
      .eq('id', assignmentId)

    if (!error) return
  } catch {}
  DemoStore.removeVolunteer(assignmentId)
}

export async function searchVolunteers(query: string) {
  const q = query.trim().toLowerCase()
  if (!q) return [] as User[]

  try {
    const { data, error } = await supabase
      .from('users')
      .select('*')
      .eq('role', 'volunteer')
      .or(`full_name.ilike.%${q}%,email.ilike.%${q}%`)
      .limit(8)

    if (!error && data && data.length > 0) {
      return data as User[]
    }
  } catch {}

  const demoUsers = DemoStore.getUsers()
  return demoUsers.filter(
    (u) =>
      u.role === 'volunteer' &&
      (u.full_name.toLowerCase().includes(q) || u.email.toLowerCase().includes(q)),
  )
}

export async function listCheckInEvents() {
  try {
    const { data, error } = await supabase
      .from('events')
      .select('*')
      .in('status', ['published', 'ongoing', 'completed'])
      .order('start_time', { ascending: true })

    if (!error && data && data.length > 0) {
      return data as Event[]
    }
  } catch {}

  return DemoStore.getEvents().filter((e) =>
    ['published', 'ongoing', 'completed'].includes(e.status),
  )
}


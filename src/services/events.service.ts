import { supabase } from '@/lib/supabase'
import type { Event, EventStatus, Registration, User } from '@/types'
import { getAttendanceStats } from '@/services/attendance.service'

export type CreateEventInput = {
  title: string
  description?: string | null
  location?: string | null
  venue?: string | null
  start_time: string
  end_time: string
  capacity?: number | null
  cover_image_url?: string | null
  organizer_id: string
  status?: EventStatus
  is_registration_open?: boolean
}

export type UpdateEventInput = Partial<Omit<CreateEventInput, 'organizer_id'>>

export type EventParticipantRow = Registration & {
  users: Pick<
    User,
    'id' | 'full_name' | 'email' | 'usn' | 'branch' | 'avatar_url'
  > | null
}

export async function listPublishedEvents() {
  const { data, error } = await supabase
    .from('events')
    .select('*')
    .in('status', ['published', 'ongoing', 'completed'])
    .order('start_time', { ascending: true })

  if (error) throw error
  return data as Event[]
}

export async function getEventById(eventId: string) {
  const { data, error } = await supabase
    .from('events')
    .select('*')
    .eq('id', eventId)
    .single()

  if (error) throw error
  return data as Event
}

export async function getEventRegistrationCount(eventId: string) {
  const { count, error } = await supabase
    .from('registrations')
    .select('id', { count: 'exact', head: true })
    .eq('event_id', eventId)
    .neq('status', 'cancelled')

  if (error) throw error
  return count ?? 0
}

export async function listOrganizerEvents(organizerId: string) {
  const { data, error } = await supabase
    .from('events')
    .select('*')
    .eq('organizer_id', organizerId)
    .order('start_time', { ascending: false })

  if (error) throw error
  return data as Event[]
}

/** Admin sees all events; organizers see their own */
export async function listManagedEvents(options: {
  userId: string
  isAdmin: boolean
}) {
  if (options.isAdmin) {
    const { data, error } = await supabase
      .from('events')
      .select('*')
      .order('start_time', { ascending: false })

    if (error) throw error
    return data as Event[]
  }

  return listOrganizerEvents(options.userId)
}

export async function createEvent(input: CreateEventInput) {
  const { data, error } = await supabase
    .from('events')
    .insert(input)
    .select()
    .single()

  if (error) throw error
  return data as Event
}

export async function updateEvent(eventId: string, input: UpdateEventInput) {
  const { data, error } = await supabase
    .from('events')
    .update(input)
    .eq('id', eventId)
    .select()
    .single()

  if (error) throw error
  return data as Event
}

export async function deleteEvent(eventId: string) {
  const { error } = await supabase.from('events').delete().eq('id', eventId)
  if (error) throw error
}

export async function listEventParticipants(eventId: string) {
  const { data, error } = await supabase
    .from('registrations')
    .select(
      '*, users(id, full_name, email, usn, branch, avatar_url)',
    )
    .eq('event_id', eventId)
    .neq('status', 'cancelled')
    .order('registered_at', { ascending: false })

  if (error) throw error
  return data as EventParticipantRow[]
}

export async function getOrganizerDashboardStats(options: {
  userId: string
  isAdmin: boolean
}) {
  const events = await listManagedEvents(options)

  const stats = await Promise.all(
    events.map(async (event) => {
      const attendance = await getAttendanceStats(event.id)
      return { event, ...attendance }
    }),
  )

  const totalEvents = events.length
  const publishedEvents = events.filter((e) =>
    ['published', 'ongoing'].includes(e.status),
  ).length
  const totalRegistrations = stats.reduce((sum, s) => sum + s.registered, 0)
  const totalCheckedIn = stats.reduce((sum, s) => sum + s.checkedIn, 0)

  return {
    totalEvents,
    publishedEvents,
    draftEvents: events.filter((e) => e.status === 'draft').length,
    totalRegistrations,
    totalCheckedIn,
    checkInRate:
      totalRegistrations === 0 ? 0 : totalCheckedIn / totalRegistrations,
    eventStats: stats,
  }
}

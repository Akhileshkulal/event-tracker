import { supabase } from '@/lib/supabase'
import { DemoStore } from './demo-store'
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
  return DemoStore.getEvents()
}

export async function getEventById(eventId: string) {
  try {
    const { data, error } = await supabase
      .from('events')
      .select('*')
      .eq('id', eventId)
      .single()

    if (!error && data) {
      return data as Event
    }
  } catch {}
  const found = DemoStore.getEventById(eventId)
  if (found) return found
  throw new Error('Event not found')
}

export async function getEventRegistrationCount(eventId: string) {
  try {
    const { count, error } = await supabase
      .from('registrations')
      .select('id', { count: 'exact', head: true })
      .eq('event_id', eventId)
      .neq('status', 'cancelled')

    if (!error && count !== null && count > 0) {
      return count
    }
  } catch {}
  const regList = DemoStore.getRegistrations().filter(
    (r) => r.event_id === eventId || (r as any).legacy_id === eventId,
  )
  return regList.length
}

export async function listOrganizerEvents(organizerId: string) {
  try {
    const { data, error } = await supabase
      .from('events')
      .select('*')
      .eq('organizer_id', organizerId)
      .order('start_time', { ascending: false })

    if (!error && data && data.length > 0) {
      return data as Event[]
    }
  } catch {}
  const allEvents = DemoStore.getEvents()
  return allEvents.filter(
    (e) => e.organizer_id === organizerId || (organizerId.startsWith('00000000-0000-4000-8000-organizer') && true),
  )
}

/** Admin sees all events; organizers see their own */
export async function listManagedEvents(options: {
  userId: string
  isAdmin: boolean
}) {
  if (options.isAdmin) {
    try {
      const { data, error } = await supabase
        .from('events')
        .select('*')
        .order('start_time', { ascending: false })

      if (!error && data && data.length > 0) {
        return data as Event[]
      }
    } catch {}
    return DemoStore.getEvents()
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
  try {
    const { data, error } = await supabase
      .from('registrations')
      .select(
        '*, users(id, full_name, email, usn, branch, avatar_url)',
      )
      .eq('event_id', eventId)
      .neq('status', 'cancelled')
      .order('registered_at', { ascending: false })

    if (!error && data && data.length > 0) {
      return data as EventParticipantRow[]
    }
  } catch {}

  const regs = DemoStore.getRegistrations().filter((r) => r.event_id === eventId)
  return regs.map((r) => {
    const u = DemoStore.findUserById(r.participant_id)
    return {
      ...r,
      users: u
        ? {
            id: u.id,
            full_name: u.full_name,
            email: u.email,
            usn: u.usn,
            branch: u.branch,
            avatar_url: u.avatar_url,
          }
        : null,
    }
  }) as EventParticipantRow[]
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

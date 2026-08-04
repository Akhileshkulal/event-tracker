import { supabase } from '@/lib/supabase'
import { DemoStore } from './demo-store'

export type CheckInTimelinePoint = {
  time: string
  label: string
  count: number
  cumulative: number
}

export type RecentCheckInRow = {
  id: string
  checked_in_at: string
  event_id: string
  participant: {
    full_name: string
    usn: string | null
    branch: string | null
  } | null
  event: {
    title: string
  } | null
}

function formatBucketLabel(date: Date) {
  return date.toLocaleTimeString([], {
    hour: 'numeric',
    minute: '2-digit',
  })
}

/** Cumulative check-ins over time for a single event */
export async function getEventCheckInTimeline(eventId: string) {
  let rows: { checked_in_at: string }[] = []
  try {
    const { data, error } = await supabase
      .from('attendance')
      .select('checked_in_at')
      .eq('event_id', eventId)
      .order('checked_in_at', { ascending: true })

    if (!error && data && data.length > 0) {
      rows = data
    }
  } catch {}

  if (rows.length === 0) {
    rows = DemoStore.getAttendance().filter((a) => a.event_id === eventId)
  }

  if (rows.length === 0) return [] as CheckInTimelinePoint[]

  const bucketMs = 15 * 60 * 1000
  const buckets = new Map<number, number>()

  for (const row of rows) {
    const ts = new Date(row.checked_in_at).getTime()
    const bucket = Math.floor(ts / bucketMs) * bucketMs
    buckets.set(bucket, (buckets.get(bucket) ?? 0) + 1)
  }

  let cumulative = 0
  return Array.from(buckets.entries())
    .sort(([a], [b]) => a - b)
    .map(([bucket, count]) => {
      cumulative += count
      const date = new Date(bucket)
      return {
        time: date.toISOString(),
        label: formatBucketLabel(date),
        count,
        cumulative,
      }
    })
}

export async function listRecentCheckIns(options: {
  eventId?: string
  organizerId?: string
  isAdmin?: boolean
  limit?: number
}) {
  const limit = options.limit ?? 12

  try {
    let query = supabase
      .from('attendance')
      .select(
        'id, checked_in_at, event_id, users!attendance_participant_id_fkey(full_name, usn, branch), events(title, organizer_id)',
      )
      .order('checked_in_at', { ascending: false })
      .limit(limit)

    if (options.eventId) {
      query = query.eq('event_id', options.eventId)
    }

    const { data, error } = await query
    if (!error && data && data.length > 0) {
      let rows = data
      if (options.organizerId && !options.isAdmin && !options.eventId) {
        rows = rows.filter((row) => {
          const event = row.events as { organizer_id?: string } | null
          return event?.organizer_id === options.organizerId
        })
      }

      return rows.map((row) => {
        const rawParticipant = Array.isArray(row.users) ? row.users[0] : row.users
        const rawEvent = Array.isArray(row.events) ? row.events[0] : row.events

        return {
          id: row.id as string,
          checked_in_at: row.checked_in_at as string,
          event_id: row.event_id as string,
          participant: (rawParticipant ?? null) as RecentCheckInRow['participant'],
          event: (rawEvent ?? null) as RecentCheckInRow['event'],
        }
      }) satisfies RecentCheckInRow[]
    }
  } catch {}

  let atts = DemoStore.getAttendance()
  if (options.eventId) {
    atts = atts.filter((a) => a.event_id === options.eventId)
  }

  return atts.slice(0, limit).map((a) => {
    const u = DemoStore.findUserById(a.participant_id)
    const ev = DemoStore.getEventById(a.event_id)
    return {
      id: a.id,
      checked_in_at: a.checked_in_at,
      event_id: a.event_id,
      participant: u ? { full_name: u.full_name, usn: u.usn, branch: u.branch } : null,
      event: ev ? { title: ev.title } : null,
    }
  })
}

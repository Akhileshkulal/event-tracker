import { useQuery } from '@tanstack/react-query'
import {
  getEventCheckInTimeline,
  listRecentCheckIns,
} from '@/services/analytics.service'
import { analyticsKeys } from '@/hooks/use-realtime-dashboard'

export function useEventCheckInTimeline(eventId: string | undefined) {
  return useQuery({
    queryKey: analyticsKeys.timeline(eventId ?? ''),
    queryFn: () => getEventCheckInTimeline(eventId!),
    enabled: Boolean(eventId),
  })
}

export function useRecentCheckIns(options: {
  eventId?: string
  organizerId?: string
  isAdmin?: boolean
  limit?: number
  enabled?: boolean
}) {
  const scope = options.eventId
    ? `event-${options.eventId}`
    : `organizer-${options.organizerId ?? 'all'}`

  return useQuery({
    queryKey: analyticsKeys.recent(scope),
    queryFn: () =>
      listRecentCheckIns({
        eventId: options.eventId,
        organizerId: options.organizerId,
        isAdmin: options.isAdmin,
        limit: options.limit,
      }),
    enabled: options.enabled ?? Boolean(options.eventId || options.organizerId),
  })
}

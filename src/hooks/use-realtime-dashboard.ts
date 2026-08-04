import { useEffect, useState } from 'react'
import { useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase'
import { eventKeys } from '@/hooks/use-events'
import { volunteerKeys } from '@/hooks/use-volunteers'

export const analyticsKeys = {
  all: ['analytics'] as const,
  timeline: (eventId: string) =>
    [...analyticsKeys.all, 'timeline', eventId] as const,
  recent: (scope: string) =>
    [...analyticsKeys.all, 'recent', scope] as const,
}

type UseRealtimeDashboardOptions = {
  userId?: string
  eventId?: string
  enabled?: boolean
}

export function useRealtimeDashboard({
  userId,
  eventId,
  enabled = true,
}: UseRealtimeDashboardOptions) {
  const queryClient = useQueryClient()
  const [isLive, setIsLive] = useState(false)

  useEffect(() => {
    if (!enabled) return

    const channelName = eventId
      ? `dashboard-event-${eventId}`
      : `dashboard-organizer-${userId ?? 'all'}`

    const channel = supabase.channel(channelName)

    const invalidateAll = () => {
      if (eventId) {
        void queryClient.invalidateQueries({
          queryKey: eventKeys.attendanceStats(eventId),
        })
        void queryClient.invalidateQueries({
          queryKey: eventKeys.participants(eventId),
        })
        void queryClient.invalidateQueries({
          queryKey: analyticsKeys.timeline(eventId),
        })
        void queryClient.invalidateQueries({
          queryKey: analyticsKeys.recent(`event-${eventId}`),
        })
        void queryClient.invalidateQueries({
          queryKey: volunteerKeys.attendanceStats(eventId),
        })
      }

      if (userId) {
        void queryClient.invalidateQueries({
          queryKey: eventKeys.organizerStats(userId),
        })
        void queryClient.invalidateQueries({
          queryKey: analyticsKeys.recent(`organizer-${userId}`),
        })
      }
    }

    channel
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'attendance',
          ...(eventId ? { filter: `event_id=eq.${eventId}` } : {}),
        },
        invalidateAll,
      )
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'registrations',
          ...(eventId ? { filter: `event_id=eq.${eventId}` } : {}),
        },
        invalidateAll,
      )
      .subscribe((status) => {
        setIsLive(status === 'SUBSCRIBED')
      })

    return () => {
      setIsLive(false)
      void supabase.removeChannel(channel)
    }
  }, [enabled, eventId, queryClient, userId])

  return { isLive }
}

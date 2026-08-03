import { useQuery } from '@tanstack/react-query'
import {
  getEventById,
  getEventRegistrationCount,
  getOrganizerDashboardStats,
  listEventParticipants,
  listManagedEvents,
  listPublishedEvents,
} from '@/services/events.service'
import { getAttendanceStats } from '@/services/attendance.service'
import {
  getMyRegistrationForEvent,
  getRegistrationById,
  listParticipantRegistrations,
} from '@/services/registrations.service'

export const eventKeys = {
  all: ['events'] as const,
  published: () => [...eventKeys.all, 'published'] as const,
  managed: (userId: string) => [...eventKeys.all, 'managed', userId] as const,
  detail: (id: string) => [...eventKeys.all, 'detail', id] as const,
  count: (id: string) => [...eventKeys.all, 'count', id] as const,
  participants: (id: string) =>
    [...eventKeys.all, 'participants', id] as const,
  attendanceStats: (id: string) =>
    [...eventKeys.all, 'attendance-stats', id] as const,
  organizerStats: (userId: string) =>
    [...eventKeys.all, 'organizer-stats', userId] as const,
}

export const registrationKeys = {
  all: ['registrations'] as const,
  mine: (userId: string) => [...registrationKeys.all, 'mine', userId] as const,
  detail: (id: string) => [...registrationKeys.all, 'detail', id] as const,
  forEvent: (eventId: string, userId: string) =>
    [...registrationKeys.all, 'event', eventId, userId] as const,
}

export function usePublishedEvents() {
  return useQuery({
    queryKey: eventKeys.published(),
    queryFn: listPublishedEvents,
  })
}

export function useManagedEvents(
  userId: string | undefined,
  isAdmin: boolean,
) {
  return useQuery({
    queryKey: eventKeys.managed(userId ?? ''),
    queryFn: () =>
      listManagedEvents({
        userId: userId!,
        isAdmin,
      }),
    enabled: Boolean(userId),
  })
}

export function useOrganizerStats(
  userId: string | undefined,
  isAdmin: boolean,
) {
  return useQuery({
    queryKey: eventKeys.organizerStats(userId ?? ''),
    queryFn: () =>
      getOrganizerDashboardStats({
        userId: userId!,
        isAdmin,
      }),
    enabled: Boolean(userId),
  })
}

export function useEvent(eventId: string | undefined) {
  return useQuery({
    queryKey: eventKeys.detail(eventId ?? ''),
    queryFn: () => getEventById(eventId!),
    enabled: Boolean(eventId),
  })
}

export function useEventRegistrationCount(eventId: string | undefined) {
  return useQuery({
    queryKey: eventKeys.count(eventId ?? ''),
    queryFn: () => getEventRegistrationCount(eventId!),
    enabled: Boolean(eventId),
  })
}

export function useEventParticipants(eventId: string | undefined) {
  return useQuery({
    queryKey: eventKeys.participants(eventId ?? ''),
    queryFn: () => listEventParticipants(eventId!),
    enabled: Boolean(eventId),
  })
}

export function useEventAttendanceStats(eventId: string | undefined) {
  return useQuery({
    queryKey: eventKeys.attendanceStats(eventId ?? ''),
    queryFn: () => getAttendanceStats(eventId!),
    enabled: Boolean(eventId),
  })
}

export function useMyRegistrations(userId: string | undefined) {
  return useQuery({
    queryKey: registrationKeys.mine(userId ?? ''),
    queryFn: () => listParticipantRegistrations(userId!),
    enabled: Boolean(userId),
  })
}

export function useMyRegistrationForEvent(
  eventId: string | undefined,
  userId: string | undefined,
) {
  return useQuery({
    queryKey: registrationKeys.forEvent(eventId ?? '', userId ?? ''),
    queryFn: () => getMyRegistrationForEvent(eventId!, userId!),
    enabled: Boolean(eventId && userId),
  })
}

export function useRegistration(registrationId: string | undefined) {
  return useQuery({
    queryKey: registrationKeys.detail(registrationId ?? ''),
    queryFn: () => getRegistrationById(registrationId!),
    enabled: Boolean(registrationId),
  })
}

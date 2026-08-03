import { useQuery } from '@tanstack/react-query'
import {
  listCheckInEvents,
  listEventVolunteers,
  listVolunteerEvents,
} from '@/services/volunteers.service'
import {
  getAttendanceStats,
  listRecentCheckInsByVolunteer,
} from '@/services/attendance.service'

export const volunteerKeys = {
  all: ['volunteers'] as const,
  events: () => [...volunteerKeys.all, 'check-in-events'] as const,
  assigned: (userId: string) =>
    [...volunteerKeys.all, 'assigned', userId] as const,
  eventVolunteers: (eventId: string) =>
    [...volunteerKeys.all, 'event', eventId] as const,
  recentCheckIns: (userId: string) =>
    [...volunteerKeys.all, 'recent-checkins', userId] as const,
  attendanceStats: (eventId: string) =>
    [...volunteerKeys.all, 'stats', eventId] as const,
}

export function useCheckInEvents() {
  return useQuery({
    queryKey: volunteerKeys.events(),
    queryFn: listCheckInEvents,
  })
}

export function useAssignedEvents(volunteerId: string | undefined) {
  return useQuery({
    queryKey: volunteerKeys.assigned(volunteerId ?? ''),
    queryFn: () => listVolunteerEvents(volunteerId!),
    enabled: Boolean(volunteerId),
  })
}

export function useEventVolunteers(eventId: string | undefined) {
  return useQuery({
    queryKey: volunteerKeys.eventVolunteers(eventId ?? ''),
    queryFn: () => listEventVolunteers(eventId!),
    enabled: Boolean(eventId),
  })
}

export function useRecentVolunteerCheckIns(volunteerId: string | undefined) {
  return useQuery({
    queryKey: volunteerKeys.recentCheckIns(volunteerId ?? ''),
    queryFn: () => listRecentCheckInsByVolunteer(volunteerId!),
    enabled: Boolean(volunteerId),
  })
}

export function useVolunteerEventStats(eventId: string | undefined) {
  return useQuery({
    queryKey: volunteerKeys.attendanceStats(eventId ?? ''),
    queryFn: () => getAttendanceStats(eventId!),
    enabled: Boolean(eventId),
  })
}

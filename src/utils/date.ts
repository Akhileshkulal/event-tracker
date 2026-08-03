import { format, formatDistanceToNow, isAfter, isBefore, parseISO } from 'date-fns'

export function formatDateTime(value: string | Date) {
  const date = typeof value === 'string' ? parseISO(value) : value
  return format(date, 'MMM d, yyyy · h:mm a')
}

export function formatDate(value: string | Date) {
  const date = typeof value === 'string' ? parseISO(value) : value
  return format(date, 'MMM d, yyyy')
}

export function formatRelative(value: string | Date) {
  const date = typeof value === 'string' ? parseISO(value) : value
  return formatDistanceToNow(date, { addSuffix: true })
}

export function isEventUpcoming(startTime: string) {
  return isAfter(parseISO(startTime), new Date())
}

export function isEventLive(startTime: string, endTime: string) {
  const now = new Date()
  return (
    isBefore(parseISO(startTime), now) && isAfter(parseISO(endTime), now)
  )
}

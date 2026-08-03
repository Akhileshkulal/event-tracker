import type { Event, Registration, User } from '@/types'

export type RegistrationWithEvent = Registration & {
  events: Event | null
}

export type RegistrationWithParticipant = Registration & {
  users: User | null
}

export type EventWithStats = Event & {
  registration_count?: number
}

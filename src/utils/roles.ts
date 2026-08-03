import type { UserRole } from '@/types'

export function roleHomePath(role: UserRole): string {
  switch (role) {
    case 'organizer':
    case 'admin':
      return '/organizer'
    case 'volunteer':
      return '/volunteer'
    case 'participant':
    default:
      return '/participant'
  }
}

export function canAccessOrganizer(role: UserRole): boolean {
  return role === 'organizer' || role === 'admin'
}

export function canAccessVolunteer(role: UserRole): boolean {
  return role === 'volunteer' || role === 'organizer' || role === 'admin'
}

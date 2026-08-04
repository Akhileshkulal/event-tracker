export type UserRole = 'participant' | 'organizer' | 'volunteer' | 'admin'

export type EventStatus =
  | 'draft'
  | 'published'
  | 'ongoing'
  | 'completed'
  | 'cancelled'

export type RegistrationStatus = 'registered' | 'cancelled' | 'checked_in'

export type AttendanceMethod = 'qr_scan' | 'manual'

export type NotificationType =
  | 'info'
  | 'success'
  | 'warning'
  | 'event'
  | 'certificate'

export interface User {
  id: string
  email: string
  full_name: string
  usn: string | null
  branch: string | null
  phone: string | null
  avatar_url: string | null
  role: UserRole
  created_at: string
  updated_at: string
}

export interface Event {
  id: string
  title: string
  description: string | null
  location: string | null
  venue: string | null
  start_time: string
  end_time: string
  capacity: number | null
  cover_image_url: string | null
  organizer_id: string
  status: EventStatus
  is_registration_open: boolean
  created_at: string
  updated_at: string
}

export interface Registration {
  id: string
  event_id: string
  participant_id: string
  qr_token: string
  qr_version?: number
  qr_rotated_at?: string | null
  status: RegistrationStatus
  registered_at: string
  cancelled_at: string | null
}

export interface Attendance {
  id: string
  registration_id: string
  event_id: string
  participant_id: string
  checked_in_by: string
  checked_in_at: string
  method: AttendanceMethod
}

export interface Certificate {
  id: string
  registration_id: string
  event_id: string
  participant_id: string
  certificate_url: string | null
  issued_at: string
}

export interface Notification {
  id: string
  user_id: string
  title: string
  message: string
  type: NotificationType
  is_read: boolean
  link: string | null
  created_at: string
}

export interface EventVolunteer {
  id: string
  event_id: string
  volunteer_id: string
  assigned_by: string | null
  assigned_at: string
}

/** Participant info returned after scanning a registration QR token */
export interface QrScanResult {
  registration_id: string
  qr_token: string
  registration_status: RegistrationStatus
  event: Pick<Event, 'id' | 'title' | 'start_time' | 'end_time' | 'location'>
  participant: Pick<
    User,
    'id' | 'full_name' | 'usn' | 'email' | 'branch' | 'avatar_url'
  >
  attendance: Pick<Attendance, 'id' | 'checked_in_at' | 'method'> | null
}

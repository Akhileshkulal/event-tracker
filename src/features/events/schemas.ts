import { z } from 'zod'

export const eventFormSchema = z
  .object({
    title: z.string().min(3, 'Title must be at least 3 characters'),
    description: z.string().optional(),
    location: z.string().optional(),
    venue: z.string().optional(),
    start_time: z.string().min(1, 'Start time is required'),
    end_time: z.string().min(1, 'End time is required'),
    capacity: z
      .string()
      .optional()
      .refine(
        (value) => !value || (!Number.isNaN(Number(value)) && Number(value) > 0),
        'Capacity must be a positive number',
      ),
    cover_image_url: z
      .string()
      .url('Enter a valid image URL')
      .optional()
      .or(z.literal('')),
    status: z.enum([
      'draft',
      'published',
      'ongoing',
      'completed',
      'cancelled',
    ]),
    is_registration_open: z.boolean(),
  })
  .refine((data) => new Date(data.end_time) > new Date(data.start_time), {
    message: 'End time must be after start time',
    path: ['end_time'],
  })

export type EventFormValues = z.infer<typeof eventFormSchema>

/** Convert datetime-local value <-> ISO for Supabase */
export function toDateTimeLocalValue(iso: string) {
  const date = new Date(iso)
  const offset = date.getTimezoneOffset()
  const local = new Date(date.getTime() - offset * 60_000)
  return local.toISOString().slice(0, 16)
}

export function fromDateTimeLocalValue(local: string) {
  return new Date(local).toISOString()
}

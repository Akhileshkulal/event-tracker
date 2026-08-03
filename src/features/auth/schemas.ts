import { z } from 'zod'

export const loginSchema = z.object({
  email: z.string().email('Enter a valid email address'),
  password: z.string().min(6, 'Password must be at least 6 characters'),
})

export type LoginFormValues = z.infer<typeof loginSchema>

export const registerSchema = z
  .object({
    full_name: z.string().min(2, 'Name must be at least 2 characters'),
    email: z.string().email('Enter a valid email address'),
    password: z.string().min(6, 'Password must be at least 6 characters'),
    confirm_password: z.string().min(6, 'Confirm your password'),
    role: z.enum(['participant', 'organizer', 'volunteer']),
    usn: z.string().optional(),
    branch: z.string().optional(),
    phone: z.string().optional(),
  })
  .refine((data) => data.password === data.confirm_password, {
    message: 'Passwords do not match',
    path: ['confirm_password'],
  })
  .superRefine((data, ctx) => {
    if (data.role === 'participant' && !data.usn?.trim()) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        message: 'USN is required for participants',
        path: ['usn'],
      })
    }
  })

export type RegisterFormValues = z.infer<typeof registerSchema>

export const profileSchema = z.object({
  full_name: z.string().min(2, 'Name must be at least 2 characters'),
  usn: z.string().optional(),
  branch: z.string().optional(),
  phone: z.string().optional(),
})

export type ProfileFormValues = z.infer<typeof profileSchema>

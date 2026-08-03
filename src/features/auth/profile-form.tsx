import { useState } from 'react'
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { Loader2 } from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import {
  profileSchema,
  type ProfileFormValues,
} from '@/features/auth/schemas'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Badge } from '@/components/ui/badge'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'

export function ProfileForm() {
  const { user, updateProfile } = useAuth()
  const [submitting, setSubmitting] = useState(false)

  const {
    register,
    handleSubmit,
    formState: { errors, isDirty },
  } = useForm<ProfileFormValues>({
    resolver: zodResolver(profileSchema),
    values: {
      full_name: user?.full_name ?? '',
      usn: user?.usn ?? '',
      branch: user?.branch ?? '',
      phone: user?.phone ?? '',
    },
  })

  if (!user) return null

  async function onSubmit(values: ProfileFormValues) {
    setSubmitting(true)
    try {
      await updateProfile({
        full_name: values.full_name,
        usn: values.usn || null,
        branch: values.branch || null,
        phone: values.phone || null,
      })
      toast.success('Profile updated')
    } catch (error) {
      const message =
        error instanceof Error ? error.message : 'Unable to update profile'
      toast.error(message)
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <Card className="w-full max-w-lg rounded-[20px] border-border bg-surface shadow-sm">
      <CardHeader className="gap-2">
        <div className="flex items-center justify-between gap-3">
          <CardTitle className="text-2xl font-semibold">Your profile</CardTitle>
          <Badge variant="secondary" className="capitalize">
            {user.role}
          </Badge>
        </div>
        <CardDescription>{user.email}</CardDescription>
      </CardHeader>
      <CardContent>
        <form className="space-y-4" onSubmit={handleSubmit(onSubmit)} noValidate>
          <div className="space-y-2">
            <Label htmlFor="full_name">Full name</Label>
            <Input
              id="full_name"
              className="h-12 rounded-xl text-base"
              aria-invalid={Boolean(errors.full_name)}
              {...register('full_name')}
            />
            {errors.full_name ? (
              <p className="text-sm text-danger">{errors.full_name.message}</p>
            ) : null}
          </div>

          <div className="grid gap-4 sm:grid-cols-2">
            <div className="space-y-2">
              <Label htmlFor="usn">USN</Label>
              <Input
                id="usn"
                className="h-12 rounded-xl text-base"
                {...register('usn')}
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="branch">Branch</Label>
              <Input
                id="branch"
                className="h-12 rounded-xl text-base"
                {...register('branch')}
              />
            </div>
          </div>

          <div className="space-y-2">
            <Label htmlFor="phone">Phone</Label>
            <Input
              id="phone"
              type="tel"
              className="h-12 rounded-xl text-base"
              {...register('phone')}
            />
          </div>

          <Button
            type="submit"
            disabled={submitting || !isDirty}
            className="h-12 w-full rounded-xl text-base sm:w-auto sm:min-w-44"
          >
            {submitting ? (
              <>
                <Loader2 className="size-4 animate-spin" />
                Saving…
              </>
            ) : (
              'Save changes'
            )}
          </Button>
        </form>
      </CardContent>
    </Card>
  )
}

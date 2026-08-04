import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Controller, useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { Eye, EyeOff, Loader2 } from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import {
  registerSchema,
  type RegisterFormValues,
} from '@/features/auth/schemas'
import { roleHomePath } from '@/utils/roles'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@/components/ui/card'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

export function RegisterForm() {
  const { signUp, refreshUser } = useAuth()
  const navigate = useNavigate()
  const [submitting, setSubmitting] = useState(false)
  const [showPassword, setShowPassword] = useState(false)
  const [showConfirmPassword, setShowConfirmPassword] = useState(false)

  const {
    register,
    control,
    handleSubmit,
    watch,
    formState: { errors },
  } = useForm<RegisterFormValues>({
    resolver: zodResolver(registerSchema),
    defaultValues: {
      full_name: '',
      email: '',
      password: '',
      confirm_password: '',
      role: 'participant',
      usn: '',
      branch: '',
      phone: '',
    },
  })

  const role = watch('role')

  async function onSubmit(values: RegisterFormValues) {
    setSubmitting(true)
    try {
      const { needsEmailConfirmation } = await signUp({
        email: values.email,
        password: values.password,
        full_name: values.full_name,
        role: values.role,
        usn: values.usn || undefined,
        branch: values.branch || undefined,
        phone: values.phone || undefined,
      })

      if (needsEmailConfirmation) {
        toast.success('Account created. Check your email to confirm, then sign in.')
        navigate('/login', { replace: true })
        return
      }

      const profile = await refreshUser()
      toast.success('Account created successfully')
      navigate(roleHomePath(profile?.role ?? values.role), { replace: true })
    } catch (error) {
      const message =
        error instanceof Error ? error.message : 'Unable to create account'
      toast.error(message)
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <Card className="w-full max-w-md rounded-[20px] border-border bg-surface shadow-sm">
      <CardHeader className="gap-2">
        <CardTitle className="text-2xl font-semibold">Create account</CardTitle>
        <CardDescription>
          Join EventTrack as a participant, organizer, or volunteer.
        </CardDescription>
      </CardHeader>
      <CardContent>
        <form className="space-y-4" onSubmit={handleSubmit(onSubmit)} noValidate>
          <div className="space-y-2">
            <Label htmlFor="full_name">Full name</Label>
            <Input
              id="full_name"
              autoComplete="name"
              placeholder="Your name"
              className="h-12 rounded-xl text-base"
              aria-invalid={Boolean(errors.full_name)}
              {...register('full_name')}
            />
            {errors.full_name ? (
              <p className="text-sm text-danger">{errors.full_name.message}</p>
            ) : null}
          </div>

          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input
              id="email"
              type="email"
              autoComplete="email"
              placeholder="you@college.edu"
              className="h-12 rounded-xl text-base"
              aria-invalid={Boolean(errors.email)}
              {...register('email')}
            />
            {errors.email ? (
              <p className="text-sm text-danger">{errors.email.message}</p>
            ) : null}
          </div>

          <div className="space-y-2">
            <Label htmlFor="role">I am a</Label>
            <Controller
              control={control}
              name="role"
              render={({ field }) => (
                <Select value={field.value} onValueChange={field.onChange}>
                  <SelectTrigger
                    id="role"
                    className="h-12 w-full rounded-xl text-base"
                  >
                    <SelectValue placeholder="Select role" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="participant">Participant</SelectItem>
                    <SelectItem value="organizer">Organizer</SelectItem>
                    <SelectItem value="volunteer">Volunteer</SelectItem>
                  </SelectContent>
                </Select>
              )}
            />
            {errors.role ? (
              <p className="text-sm text-danger">{errors.role.message}</p>
            ) : null}
          </div>

          {role === 'participant' ? (
            <div className="grid gap-4 sm:grid-cols-2">
              <div className="space-y-2">
                <Label htmlFor="usn">USN</Label>
                <Input
                  id="usn"
                  placeholder="1XX21CS001"
                  className="h-12 rounded-xl text-base"
                  aria-invalid={Boolean(errors.usn)}
                  {...register('usn')}
                />
                {errors.usn ? (
                  <p className="text-sm text-danger">{errors.usn.message}</p>
                ) : null}
              </div>
              <div className="space-y-2">
                <Label htmlFor="branch">Branch</Label>
                <Input
                  id="branch"
                  placeholder="CSE"
                  className="h-12 rounded-xl text-base"
                  {...register('branch')}
                />
              </div>
            </div>
          ) : null}

          <div className="space-y-2">
            <Label htmlFor="phone">Phone (optional)</Label>
            <Input
              id="phone"
              type="tel"
              autoComplete="tel"
              placeholder="+91…"
              className="h-12 rounded-xl text-base"
              {...register('phone')}
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="password">Password</Label>
            <div className="relative">
              <Input
                id="password"
                type={showPassword ? 'text' : 'password'}
                autoComplete="new-password"
                placeholder="At least 6 characters"
                className="h-12 rounded-xl text-base pr-10"
                aria-invalid={Boolean(errors.password)}
                {...register('password')}
              />
              <Button
                type="button"
                variant="ghost"
                size="sm"
                className="absolute right-1 top-1/2 -translate-y-1/2 h-8 w-8 p-0 text-muted-foreground hover:text-foreground"
                onClick={() => setShowPassword(!showPassword)}
                title={showPassword ? 'Hide password' : 'Show password'}
              >
                {showPassword ? (
                  <EyeOff className="size-4" />
                ) : (
                  <Eye className="size-4" />
                )}
                <span className="sr-only">
                  {showPassword ? 'Hide password' : 'Show password'}
                </span>
              </Button>
            </div>
            {errors.password ? (
              <p className="text-sm text-danger">{errors.password.message}</p>
            ) : null}
          </div>

          <div className="space-y-2">
            <Label htmlFor="confirm_password">Confirm password</Label>
            <div className="relative">
              <Input
                id="confirm_password"
                type={showConfirmPassword ? 'text' : 'password'}
                autoComplete="new-password"
                placeholder="Repeat password"
                className="h-12 rounded-xl text-base pr-10"
                aria-invalid={Boolean(errors.confirm_password)}
                {...register('confirm_password')}
              />
              <Button
                type="button"
                variant="ghost"
                size="sm"
                className="absolute right-1 top-1/2 -translate-y-1/2 h-8 w-8 p-0 text-muted-foreground hover:text-foreground"
                onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                title={showConfirmPassword ? 'Hide password' : 'Show password'}
              >
                {showConfirmPassword ? (
                  <EyeOff className="size-4" />
                ) : (
                  <Eye className="size-4" />
                )}
                <span className="sr-only">
                  {showConfirmPassword ? 'Hide password' : 'Show password'}
                </span>
              </Button>
            </div>
            {errors.confirm_password ? (
              <p className="text-sm text-danger">
                {errors.confirm_password.message}
              </p>
            ) : null}
          </div>

          <Button
            type="submit"
            disabled={submitting}
            className="h-12 w-full rounded-xl text-base"
          >
            {submitting ? (
              <>
                <Loader2 className="size-4 animate-spin" />
                Creating account…
              </>
            ) : (
              'Create account'
            )}
          </Button>
        </form>

        <p className="mt-6 text-center text-sm text-muted-foreground">
          Already have an account?{' '}
          <Link to="/login" className="font-medium text-primary hover:underline">
            Sign in
          </Link>
        </p>
      </CardContent>
    </Card>
  )
}

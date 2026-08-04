import { useState } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { Eye, EyeOff, Loader2 } from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import { loginSchema, type LoginFormValues } from '@/features/auth/schemas'
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

export function LoginForm() {
  const { signIn } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [submitting, setSubmitting] = useState(false)
  const [showPassword, setShowPassword] = useState(false)

  const from =
    (location.state as { from?: string } | null)?.from ?? null

  const {
    register,
    handleSubmit,
    setValue,
    formState: { errors },
  } = useForm<LoginFormValues>({
    resolver: zodResolver(loginSchema),
    defaultValues: {
      email: '',
      password: '',
    },
  })

  async function onSubmit(values: LoginFormValues) {
    setSubmitting(true)
    try {
      const profile = await signIn(values.email, values.password)
      toast.success(`Welcome back, ${profile.full_name}`)
      navigate(from ?? roleHomePath(profile.role), { replace: true })
    } catch (error) {
      const message =
        error instanceof Error ? error.message : 'Unable to sign in'
      toast.error(message)
    } finally {
      setSubmitting(false)
    }
  }

  const handleFillDemo = (email: string, pass: string = '12345678') => {
    setValue('email', email, { shouldValidate: true, shouldDirty: true, shouldTouch: true })
    setValue('password', pass, { shouldValidate: true, shouldDirty: true, shouldTouch: true })
  }

  return (
    <Card className="w-full max-w-md rounded-[20px] border-border bg-surface shadow-sm">
      <CardHeader className="gap-2">
        <CardTitle className="text-2xl font-semibold">Welcome back</CardTitle>
        <CardDescription>
          Sign in to manage events, scan QR codes, or view your registrations.
        </CardDescription>
      </CardHeader>
      <CardContent>
        <form className="space-y-4" onSubmit={handleSubmit(onSubmit)} noValidate>
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
            <Label htmlFor="password">Password</Label>
            <div className="relative">
              <Input
                id="password"
                type={showPassword ? 'text' : 'password'}
                autoComplete="current-password"
                placeholder="••••••••"
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

          <Button
            type="submit"
            disabled={submitting}
            className="h-12 w-full rounded-xl text-base"
          >
            {submitting ? (
              <>
                <Loader2 className="size-4 animate-spin" />
                Signing in…
              </>
            ) : (
              'Sign in'
            )}
          </Button>
        </form>

        <div className="mt-6 rounded-xl border border-border bg-accent/40 p-3.5 space-y-2">
          <p className="text-xs font-semibold text-foreground">
            Excel Demo Accounts (Click to auto-fill)
          </p>
          <div className="grid grid-cols-3 gap-1.5 pt-1">
            <Button
              type="button"
              variant="outline"
              size="sm"
              className="h-8 text-[11px] rounded-lg px-1 truncate"
              onClick={() => handleFillDemo('user1@gmail.com')}
            >
              Participant
            </Button>
            <Button
              type="button"
              variant="outline"
              size="sm"
              className="h-8 text-[11px] rounded-lg px-1 truncate"
              onClick={() => handleFillDemo('organizer1@eventtrack.com')}
            >
              Organizer
            </Button>
            <Button
              type="button"
              variant="outline"
              size="sm"
              className="h-8 text-[11px] rounded-lg px-1 truncate"
              onClick={() => handleFillDemo('volunteer1@eventtrack.com')}
            >
              Volunteer
            </Button>
          </div>
        </div>

        <p className="mt-4 text-center text-sm text-muted-foreground">
          New here?{' '}
          <Link to="/register" className="font-medium text-primary hover:underline">
            Create an account
          </Link>
        </p>
      </CardContent>
    </Card>
  )
}

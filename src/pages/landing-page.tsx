import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { ArrowRight, QrCode, CalendarDays, Users } from 'lucide-react'
import { AppNavbar } from '@/components/layout/app-navbar'
import { Button } from '@/components/ui/button'
import { useAuth } from '@/contexts/auth-context'
import { roleHomePath } from '@/utils/roles'

export function LandingPage() {
  const { isAuthenticated, user } = useAuth()

  return (
    <div className="relative min-h-dvh overflow-hidden bg-background">
      <div
        aria-hidden
        className="pointer-events-none absolute inset-0 bg-[radial-gradient(ellipse_at_top,_#dbeafe_0%,_transparent_55%),linear-gradient(180deg,#f8fafc_0%,#eff6ff_45%,#f8fafc_100%)]"
      />
      <div
        aria-hidden
        className="pointer-events-none absolute -top-24 right-[-20%] h-72 w-72 rounded-full bg-primary/10 blur-3xl"
      />

      <AppNavbar className="relative" />

      <main className="relative mx-auto flex min-h-[calc(100dvh-3.5rem)] w-full max-w-5xl flex-col justify-center px-4 pb-16 pt-10 sm:px-6">
        <section className="max-w-2xl space-y-6">
          <p className="text-3xl font-semibold tracking-tight text-primary sm:text-5xl">
            EventTrack
          </p>
          <h1 className="text-balance text-2xl font-semibold tracking-tight text-foreground sm:text-4xl">
            Event registration, QR check-in, and live attendance — in one place.
          </h1>
          <p className="max-w-xl text-base text-muted-foreground sm:text-lg">
            Built for campuses and organizers who need fast mobile check-ins
            without spreadsheets.
          </p>

          <div className="flex flex-col gap-3 sm:flex-row sm:items-center">
            {isAuthenticated && user ? (
              <Button asChild className="h-12 min-w-44 rounded-xl text-base">
                <Link to={roleHomePath(user.role)}>
                  Go to dashboard
                  <ArrowRight className="size-4" />
                </Link>
              </Button>
            ) : (
              <>
                <Button asChild className="h-12 min-w-44 rounded-xl text-base">
                  <Link to="/register">
                    Get started
                    <ArrowRight className="size-4" />
                  </Link>
                </Button>
                <Button
                  asChild
                  variant="outline"
                  className="h-12 min-w-44 rounded-xl text-base"
                >
                  <Link to="/login">Sign in</Link>
                </Button>
              </>
            )}
          </div>
        </section>

        <section className="mt-14 grid gap-6 border-t border-border/70 pt-10 sm:grid-cols-3">
          <Feature
            icon={<CalendarDays className="size-5 text-primary" />}
            title="Discover & register"
            text="Browse events and register in seconds."
          />
          <Feature
            icon={<QrCode className="size-5 text-primary" />}
            title="Unique QR per registration"
            text="Secure tokens — no personal data in the code."
          />
          <Feature
            icon={<Users className="size-5 text-primary" />}
            title="Volunteer scanning"
            text="Camera check-in with live attendance updates."
          />
        </section>
      </main>
    </div>
  )
}

function Feature({
  icon,
  title,
  text,
}: {
  icon: ReactNode
  title: string
  text: string
}) {
  return (
    <div className="space-y-2">
      <div className="flex size-10 items-center justify-center rounded-xl bg-accent">
        {icon}
      </div>
      <h2 className="text-base font-medium text-foreground">{title}</h2>
      <p className="text-sm text-muted-foreground">{text}</p>
    </div>
  )
}

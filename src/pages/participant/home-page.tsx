import type { ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { ArrowRight, CalendarDays, QrCode } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import { useMyRegistrations, usePublishedEvents } from '@/hooks/use-events'
import { EventCard } from '@/components/shared/event-card'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'
import { isEventUpcoming } from '@/utils/date'

export function ParticipantHomePage() {
  const { user } = useAuth()
  const eventsQuery = usePublishedEvents()
  const regsQuery = useMyRegistrations(user?.id)

  const upcomingEvents =
    eventsQuery.data?.filter(
      (event) =>
        isEventUpcoming(event.start_time) ||
        event.status === 'published' ||
        event.status === 'ongoing',
    ) ?? []

  const activeRegs =
    regsQuery.data?.filter((reg) => reg.status !== 'cancelled') ?? []

  return (
    <main className="mx-auto w-full max-w-5xl space-y-8 px-4 py-6 sm:px-6">
      <section className="space-y-2">
        <p className="text-sm font-medium text-primary">Participant</p>
        <h1 className="text-2xl font-semibold tracking-tight sm:text-3xl">
          Hi{user?.full_name ? `, ${user.full_name.split(' ')[0]}` : ''}
        </h1>
        <p className="text-muted-foreground">
          Discover events and keep your check-in QR ready.
        </p>
      </section>

      <section className="grid gap-3 sm:grid-cols-2">
        <QuickLink
          to="/participant/events"
          icon={<CalendarDays className="size-5 text-primary" />}
          title="Browse events"
          text="Find and register for upcoming events"
        />
        <QuickLink
          to="/participant/registrations"
          icon={<QrCode className="size-5 text-primary" />}
          title="My registrations"
          text={`${activeRegs.length} active registration${activeRegs.length === 1 ? '' : 's'}`}
        />
      </section>

      <section className="space-y-4">
        <div className="flex items-center justify-between gap-3">
          <h2 className="text-lg font-semibold">Upcoming events</h2>
          <Button asChild variant="ghost" className="h-10 rounded-xl">
            <Link to="/participant/events">
              See all
              <ArrowRight className="size-4" />
            </Link>
          </Button>
        </div>

        {eventsQuery.isLoading ? (
          <div className="grid gap-4 sm:grid-cols-2">
            <Skeleton className="h-64 rounded-[20px]" />
            <Skeleton className="h-64 rounded-[20px]" />
          </div>
        ) : upcomingEvents.length === 0 ? (
          <EmptyState
            title="No events yet"
            text="When organizers publish events, they’ll show up here."
          />
        ) : (
          <div className="grid gap-4 sm:grid-cols-2">
            {upcomingEvents.slice(0, 4).map((event) => (
              <EventCard
                key={event.id}
                event={event}
                to={`/participant/events/${event.id}`}
              />
            ))}
          </div>
        )}
      </section>

      <section className="space-y-4">
        <h2 className="text-lg font-semibold">Your QR codes</h2>
        {regsQuery.isLoading ? (
          <Skeleton className="h-24 rounded-[20px]" />
        ) : activeRegs.length === 0 ? (
          <EmptyState
            title="No registrations yet"
            text="Register for an event to get your unique check-in QR."
            action={
              <Button asChild className="h-11 rounded-xl">
                <Link to="/participant/events">Browse events</Link>
              </Button>
            }
          />
        ) : (
          <ul className="space-y-3">
            {activeRegs.slice(0, 3).map((reg) => (
              <li key={reg.id}>
                <Link
                  to={`/participant/registrations/${reg.id}`}
                  className="flex items-center justify-between gap-3 rounded-[20px] bg-surface px-4 py-4 ring-1 ring-border transition hover:ring-primary/30"
                >
                  <div className="min-w-0">
                    <p className="truncate font-medium">
                      {reg.events?.title ?? 'Event'}
                    </p>
                    <p className="text-sm capitalize text-muted-foreground">
                      {reg.status.replace('_', ' ')}
                    </p>
                  </div>
                  <QrCode className="size-5 shrink-0 text-primary" />
                </Link>
              </li>
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}

function QuickLink({
  to,
  icon,
  title,
  text,
}: {
  to: string
  icon: ReactNode
  title: string
  text: string
}) {
  return (
    <Link
      to={to}
      className="flex items-start gap-3 rounded-[20px] bg-surface p-4 ring-1 ring-border transition hover:ring-primary/30"
    >
      <div className="flex size-10 shrink-0 items-center justify-center rounded-xl bg-accent">
        {icon}
      </div>
      <div>
        <p className="font-medium text-foreground">{title}</p>
        <p className="text-sm text-muted-foreground">{text}</p>
      </div>
    </Link>
  )
}

function EmptyState({
  title,
  text,
  action,
}: {
  title: string
  text: string
  action?: ReactNode
}) {
  return (
    <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
      <p className="font-medium text-foreground">{title}</p>
      <p className="mt-1 text-sm text-muted-foreground">{text}</p>
      {action ? <div className="mt-4 flex justify-center">{action}</div> : null}
    </div>
  )
}

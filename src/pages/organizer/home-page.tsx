import { Link } from 'react-router-dom'
import {
  CalendarDays,
  ClipboardCheck,
  Plus,
  Users,
} from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import { useManagedEvents, useOrganizerStats } from '@/hooks/use-events'
import { DashboardCard } from '@/components/shared/dashboard-card'
import { formatDateTime } from '@/utils/date'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function OrganizerHomePage() {
  const { user } = useAuth()
  const isAdmin = user?.role === 'admin'
  const statsQuery = useOrganizerStats(user?.id, Boolean(isAdmin))
  const eventsQuery = useManagedEvents(user?.id, Boolean(isAdmin))

  const stats = statsQuery.data
  const recentEvents = eventsQuery.data?.slice(0, 5) ?? []

  return (
    <main className="mx-auto w-full max-w-5xl space-y-8 px-4 py-6 sm:px-6">
      <section className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div className="space-y-2">
          <p className="text-sm font-medium text-primary">Organizer</p>
          <h1 className="text-2xl font-semibold tracking-tight sm:text-3xl">
            Dashboard
          </h1>
          <p className="text-muted-foreground">
            Create events, track registrations, and monitor check-ins.
          </p>
        </div>
        <Button asChild className="h-12 rounded-xl px-5 text-base">
          <Link to="/organizer/events/new">
            <Plus className="size-4" />
            New event
          </Link>
        </Button>
      </section>

      {statsQuery.isLoading ? (
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <Skeleton className="h-28 rounded-[20px]" />
          <Skeleton className="h-28 rounded-[20px]" />
          <Skeleton className="h-28 rounded-[20px]" />
          <Skeleton className="h-28 rounded-[20px]" />
        </div>
      ) : (
        <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          <DashboardCard
            title="Total events"
            value={stats?.totalEvents ?? 0}
            hint={`${stats?.publishedEvents ?? 0} live / published`}
            icon={<CalendarDays className="size-5 text-primary" />}
          />
          <DashboardCard
            title="Drafts"
            value={stats?.draftEvents ?? 0}
            icon={<CalendarDays className="size-5 text-primary" />}
          />
          <DashboardCard
            title="Registrations"
            value={stats?.totalRegistrations ?? 0}
            icon={<Users className="size-5 text-primary" />}
          />
          <DashboardCard
            title="Checked in"
            value={stats?.totalCheckedIn ?? 0}
            hint={`${Math.round((stats?.checkInRate ?? 0) * 100)}% rate`}
            icon={<ClipboardCheck className="size-5 text-primary" />}
          />
        </section>
      )}

      <section className="space-y-4">
        <div className="flex items-center justify-between gap-3">
          <h2 className="text-lg font-semibold">Your events</h2>
          <Button asChild variant="ghost" className="h-10 rounded-xl">
            <Link to="/organizer/events">View all</Link>
          </Button>
        </div>

        {eventsQuery.isLoading ? (
          <Skeleton className="h-40 rounded-[20px]" />
        ) : recentEvents.length === 0 ? (
          <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
            <p className="font-medium">No events yet</p>
            <p className="mt-1 text-sm text-muted-foreground">
              Create your first event to start taking registrations.
            </p>
            <Button asChild className="mt-4 h-11 rounded-xl">
              <Link to="/organizer/events/new">Create event</Link>
            </Button>
          </div>
        ) : (
          <ul className="space-y-3">
            {recentEvents.map((event) => (
              <li key={event.id}>
                <Link
                  to={`/organizer/events/${event.id}`}
                  className="flex items-start justify-between gap-3 rounded-[20px] bg-surface p-4 ring-1 ring-border transition hover:ring-primary/30"
                >
                  <div className="min-w-0 space-y-1">
                    <div className="flex flex-wrap items-center gap-2">
                      <p className="truncate font-medium">{event.title}</p>
                      <StatusBadge status={event.status} />
                    </div>
                    <p className="text-sm text-muted-foreground">
                      {formatDateTime(event.start_time)}
                    </p>
                  </div>
                </Link>
              </li>
            ))}
          </ul>
        )}
      </section>
    </main>
  )
}

function StatusBadge({ status }: { status: string }) {
  if (status === 'published' || status === 'ongoing') {
    return <Badge className="bg-success text-success-foreground capitalize">{status}</Badge>
  }
  if (status === 'draft') {
    return <Badge variant="secondary">Draft</Badge>
  }
  if (status === 'cancelled') {
    return <Badge variant="destructive">Cancelled</Badge>
  }
  return (
    <Badge variant="outline" className="capitalize">
      {status}
    </Badge>
  )
}

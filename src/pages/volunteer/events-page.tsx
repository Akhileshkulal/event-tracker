import { Link } from 'react-router-dom'
import { useCheckInEvents } from '@/hooks/use-volunteers'
import { EventCard } from '@/components/shared/event-card'
import { Skeleton } from '@/components/ui/skeleton'

export function VolunteerEventsPage() {
  const eventsQuery = useCheckInEvents()

  return (
    <main className="mx-auto w-full max-w-5xl space-y-6 px-4 py-6 sm:px-6">
      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">Events</h1>
        <p className="text-muted-foreground">
          Open an event to view check-in stats, then scan attendees.
        </p>
      </div>

      {eventsQuery.isLoading ? (
        <div className="grid gap-4 sm:grid-cols-2">
          <Skeleton className="h-64 rounded-[20px]" />
          <Skeleton className="h-64 rounded-[20px]" />
        </div>
      ) : (eventsQuery.data?.length ?? 0) === 0 ? (
        <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
          <p className="font-medium">No published events</p>
          <p className="mt-1 text-sm text-muted-foreground">
            Ask an organizer to publish an event first.
          </p>
        </div>
      ) : (
        <div className="grid gap-4 sm:grid-cols-2">
          {eventsQuery.data!.map((event) => (
            <EventCard
              key={event.id}
              event={event}
              to={`/volunteer/events/${event.id}`}
            />
          ))}
        </div>
      )}

      <p className="text-center text-sm text-muted-foreground">
        Or go straight to{' '}
        <Link to="/volunteer/scanner" className="font-medium text-primary">
          the scanner
        </Link>
        .
      </p>
    </main>
  )
}

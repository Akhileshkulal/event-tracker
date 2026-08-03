import { Link } from 'react-router-dom'
import { Plus } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import { useManagedEvents } from '@/hooks/use-events'
import { EventCard } from '@/components/shared/event-card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function OrganizerEventsPage() {
  const { user } = useAuth()
  const eventsQuery = useManagedEvents(user?.id, user?.role === 'admin')

  return (
    <main className="mx-auto w-full max-w-5xl space-y-6 px-4 py-6 sm:px-6">
      <div className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div className="space-y-2">
          <h1 className="text-2xl font-semibold tracking-tight">Events</h1>
          <p className="text-muted-foreground">
            Manage drafts, publish events, and open registration.
          </p>
        </div>
        <Button asChild className="h-12 rounded-xl px-5 text-base">
          <Link to="/organizer/events/new">
            <Plus className="size-4" />
            New event
          </Link>
        </Button>
      </div>

      {eventsQuery.isLoading ? (
        <div className="grid gap-4 sm:grid-cols-2">
          <Skeleton className="h-64 rounded-[20px]" />
          <Skeleton className="h-64 rounded-[20px]" />
        </div>
      ) : eventsQuery.isError ? (
        <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
          <p className="font-medium text-danger">Couldn’t load events</p>
        </div>
      ) : (eventsQuery.data?.length ?? 0) === 0 ? (
        <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
          <p className="font-medium">No events yet</p>
          <Button asChild className="mt-4 h-11 rounded-xl">
            <Link to="/organizer/events/new">Create your first event</Link>
          </Button>
        </div>
      ) : (
        <div className="grid gap-4 sm:grid-cols-2">
          {eventsQuery.data!.map((event) => (
            <div key={event.id} className="relative">
              <div className="absolute top-3 right-3 z-10">
                <Badge
                  variant={
                    event.status === 'draft' ? 'secondary' : 'outline'
                  }
                  className="capitalize"
                >
                  {event.status}
                </Badge>
              </div>
              <EventCard
                event={event}
                to={`/organizer/events/${event.id}`}
              />
            </div>
          ))}
        </div>
      )}
    </main>
  )
}

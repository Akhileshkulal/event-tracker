import { useMemo, useState } from 'react'
import { Search } from 'lucide-react'
import { usePublishedEvents } from '@/hooks/use-events'
import { EventCard } from '@/components/shared/event-card'
import { Input } from '@/components/ui/input'
import { Skeleton } from '@/components/ui/skeleton'
import { isEventUpcoming } from '@/utils/date'

export function ParticipantEventsPage() {
  const eventsQuery = usePublishedEvents()
  const [query, setQuery] = useState('')

  const filtered = useMemo(() => {
    const events = eventsQuery.data ?? []
    const q = query.trim().toLowerCase()

    return events
      .filter((event) => {
        if (!q) return true
        return (
          event.title.toLowerCase().includes(q) ||
          event.description?.toLowerCase().includes(q) ||
          event.location?.toLowerCase().includes(q) ||
          event.venue?.toLowerCase().includes(q)
        )
      })
      .sort((a, b) => {
        const aUp = isEventUpcoming(a.start_time) ? 0 : 1
        const bUp = isEventUpcoming(b.start_time) ? 0 : 1
        if (aUp !== bUp) return aUp - bUp
        return (
          new Date(a.start_time).getTime() - new Date(b.start_time).getTime()
        )
      })
  }, [eventsQuery.data, query])

  return (
    <main className="mx-auto w-full max-w-5xl space-y-6 px-4 py-6 sm:px-6">
      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">Events</h1>
        <p className="text-muted-foreground">
          Browse published events and register to get your QR.
        </p>
      </div>

      <div className="relative">
        <Search className="pointer-events-none absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted-foreground" />
        <Input
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search events…"
          className="h-12 rounded-xl pl-10 text-base"
        />
      </div>

      {eventsQuery.isLoading ? (
        <div className="grid gap-4 sm:grid-cols-2">
          <Skeleton className="h-64 rounded-[20px]" />
          <Skeleton className="h-64 rounded-[20px]" />
        </div>
      ) : eventsQuery.isError ? (
        <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
          <p className="font-medium text-danger">Couldn’t load events</p>
          <p className="mt-1 text-sm text-muted-foreground">
            {eventsQuery.error instanceof Error
              ? eventsQuery.error.message
              : 'Please try again'}
          </p>
        </div>
      ) : filtered.length === 0 ? (
        <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
          <p className="font-medium">No events found</p>
          <p className="mt-1 text-sm text-muted-foreground">
            {query
              ? 'Try a different search.'
              : 'Organizers haven’t published any events yet.'}
          </p>
        </div>
      ) : (
        <div className="grid gap-4 sm:grid-cols-2">
          {filtered.map((event) => (
            <EventCard
              key={event.id}
              event={event}
              to={`/participant/events/${event.id}`}
            />
          ))}
        </div>
      )}
    </main>
  )
}

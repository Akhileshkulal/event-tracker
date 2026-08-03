import { Link } from 'react-router-dom'
import { ScanLine } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import {
  useAssignedEvents,
  useRecentVolunteerCheckIns,
} from '@/hooks/use-volunteers'
import { formatDateTime, formatRelative } from '@/utils/date'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function VolunteerHomePage() {
  const { user } = useAuth()
  const assignedQuery = useAssignedEvents(user?.id)
  const recentQuery = useRecentVolunteerCheckIns(user?.id)

  const assigned =
    assignedQuery.data?.filter((row) => row.events != null) ?? []
  const recent = recentQuery.data ?? []

  return (
    <main className="mx-auto w-full max-w-5xl space-y-8 px-4 py-6 sm:px-6">
      <section className="space-y-3">
        <p className="text-sm font-medium text-primary">Volunteer</p>
        <h1 className="text-2xl font-semibold tracking-tight sm:text-3xl">
          Check-in desk
        </h1>
        <p className="text-muted-foreground">
          Validate attendees and mark attendance. Camera scanner comes next.
        </p>
        <Button asChild className="h-12 w-full rounded-xl text-base sm:w-auto">
          <Link to="/volunteer/scanner">
            <ScanLine className="size-4" />
            Open scanner
          </Link>
        </Button>
      </section>

      <section className="space-y-4">
        <h2 className="text-lg font-semibold">Assigned events</h2>
        {assignedQuery.isLoading ? (
          <Skeleton className="h-28 rounded-[20px]" />
        ) : assigned.length === 0 ? (
          <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
            <p className="font-medium">No assignments yet</p>
            <p className="mt-1 text-sm text-muted-foreground">
              Organizers can assign you to events. You can still check in any
              published event.
            </p>
            <Button asChild variant="outline" className="mt-4 h-11 rounded-xl">
              <Link to="/volunteer/events">Browse events</Link>
            </Button>
          </div>
        ) : (
          <ul className="space-y-3">
            {assigned.map((row) => (
              <li key={row.id}>
                <Link
                  to={`/volunteer/events/${row.event_id}`}
                  className="block rounded-[20px] bg-surface p-4 ring-1 ring-border transition hover:ring-primary/30"
                >
                  <p className="font-medium">{row.events?.title}</p>
                  {row.events?.start_time ? (
                    <p className="mt-1 text-sm text-muted-foreground">
                      {formatDateTime(row.events.start_time)}
                    </p>
                  ) : null}
                </Link>
              </li>
            ))}
          </ul>
        )}
      </section>

      <section className="space-y-4">
        <h2 className="text-lg font-semibold">Your recent check-ins</h2>
        {recentQuery.isLoading ? (
          <Skeleton className="h-28 rounded-[20px]" />
        ) : recent.length === 0 ? (
          <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
            <p className="font-medium">No check-ins yet</p>
            <p className="mt-1 text-sm text-muted-foreground">
              Validated attendees will appear here after you mark attendance.
            </p>
          </div>
        ) : (
          <ul className="space-y-3">
            {recent.map((row) => {
              const participant = row.users as
                | { full_name?: string; usn?: string }
                | null
              const event = row.events as { title?: string } | null
              return (
                <li
                  key={row.id}
                  className="rounded-[20px] bg-surface px-4 py-3 ring-1 ring-border"
                >
                  <p className="font-medium">
                    {participant?.full_name ?? 'Participant'}
                  </p>
                  <p className="text-sm text-muted-foreground">
                    {event?.title ?? 'Event'}
                    {participant?.usn ? ` · ${participant.usn}` : ''}
                  </p>
                  <p className="mt-1 text-xs text-muted-foreground">
                    {formatRelative(row.checked_in_at)}
                  </p>
                </li>
              )
            })}
          </ul>
        )}
      </section>
    </main>
  )
}

import { Link } from 'react-router-dom'
import { QrCode } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import { useMyRegistrations } from '@/hooks/use-events'
import { formatDateTime } from '@/utils/date'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function ParticipantRegistrationsPage() {
  const { user } = useAuth()
  const regsQuery = useMyRegistrations(user?.id)

  return (
    <main className="mx-auto w-full max-w-5xl space-y-6 px-4 py-6 sm:px-6">
      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">My registrations</h1>
        <p className="text-muted-foreground">
          Each registration has its own unique check-in QR.
        </p>
      </div>

      {regsQuery.isLoading ? (
        <div className="space-y-3">
          <Skeleton className="h-24 rounded-[20px]" />
          <Skeleton className="h-24 rounded-[20px]" />
        </div>
      ) : regsQuery.isError ? (
        <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
          <p className="font-medium text-danger">Couldn’t load registrations</p>
        </div>
      ) : (regsQuery.data?.length ?? 0) === 0 ? (
        <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
          <p className="font-medium">No registrations yet</p>
          <p className="mt-1 text-sm text-muted-foreground">
            Register for an event to generate your QR code.
          </p>
          <Button asChild className="mt-4 h-11 rounded-xl">
            <Link to="/participant/events">Browse events</Link>
          </Button>
        </div>
      ) : (
        <ul className="space-y-3">
          {regsQuery.data!.map((reg) => (
            <li key={reg.id}>
              <Link
                to={`/participant/registrations/${reg.id}`}
                className="flex items-start justify-between gap-4 rounded-[20px] bg-surface p-4 ring-1 ring-border transition hover:ring-primary/30"
              >
                <div className="min-w-0 space-y-2">
                  <div className="flex flex-wrap items-center gap-2">
                    <p className="truncate font-medium">
                      {reg.events?.title ?? 'Event'}
                    </p>
                    <StatusBadge status={reg.status} />
                  </div>
                  {reg.events?.start_time ? (
                    <p className="text-sm text-muted-foreground">
                      {formatDateTime(reg.events.start_time)}
                    </p>
                  ) : null}
                </div>
                <div className="flex size-11 shrink-0 items-center justify-center rounded-xl bg-accent">
                  <QrCode className="size-5 text-primary" />
                </div>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </main>
  )
}

function StatusBadge({ status }: { status: string }) {
  if (status === 'checked_in') {
    return (
      <Badge className="bg-success text-success-foreground">Checked in</Badge>
    )
  }
  if (status === 'registered') {
    return <Badge variant="secondary">Registered</Badge>
  }
  return (
    <Badge variant="outline" className="capitalize">
      {status}
    </Badge>
  )
}

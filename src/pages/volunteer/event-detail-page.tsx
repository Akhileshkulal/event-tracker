import { Link, useParams } from 'react-router-dom'
import { ArrowLeft, ScanLine } from 'lucide-react'
import {
  useCheckInEvents,
  useVolunteerEventStats,
} from '@/hooks/use-volunteers'
import { DashboardCard } from '@/components/shared/dashboard-card'
import { CheckInPanel } from '@/features/scanner/check-in-panel'
import { formatDateTime } from '@/utils/date'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function VolunteerEventDetailPage() {
  const { eventId } = useParams<{ eventId: string }>()
  const eventsQuery = useCheckInEvents()
  const statsQuery = useVolunteerEventStats(eventId)

  const event = eventsQuery.data?.find((item) => item.id === eventId)

  if (eventsQuery.isLoading) {
    return (
      <main className="mx-auto w-full max-w-lg space-y-4 px-4 py-6 sm:px-6">
        <Skeleton className="h-8 w-32" />
        <Skeleton className="h-40 rounded-[20px]" />
      </main>
    )
  }

  if (!event) {
    return (
      <main className="mx-auto w-full max-w-lg px-4 py-10 text-center sm:px-6">
        <p className="font-medium">Event not found</p>
        <Button asChild className="mt-4 h-11 rounded-xl">
          <Link to="/volunteer/events">Back</Link>
        </Button>
      </main>
    )
  }

  return (
    <main className="mx-auto w-full max-w-lg space-y-6 px-4 py-6 sm:px-6">
      <Button
        asChild
        variant="ghost"
        className="h-11 rounded-xl px-3 text-muted-foreground"
      >
        <Link to="/volunteer/events">
          <ArrowLeft className="size-4" />
          Events
        </Link>
      </Button>

      <section className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">{event.title}</h1>
        <p className="text-sm text-muted-foreground">
          {formatDateTime(event.start_time)}
        </p>
      </section>

      <section className="grid grid-cols-3 gap-3">
        <DashboardCard title="Registered" value={statsQuery.data?.registered ?? 0} />
        <DashboardCard title="In" value={statsQuery.data?.checkedIn ?? 0} />
        <DashboardCard title="Pending" value={statsQuery.data?.pending ?? 0} />
      </section>

      <Button asChild className="h-12 w-full rounded-xl text-base">
        <Link to="/volunteer/scanner">
          <ScanLine className="size-4" />
          Open full scanner
        </Link>
      </Button>

      <div className="rounded-[20px] bg-surface p-5 ring-1 ring-border">
        <CheckInPanel
          method="qr_scan"
          onCheckedIn={() => {
            void statsQuery.refetch()
          }}
        />
      </div>
    </main>
  )
}

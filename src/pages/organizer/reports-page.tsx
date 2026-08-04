import { Link, useNavigate } from 'react-router-dom'
import { ArrowLeft } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import { useOrganizerStats } from '@/hooks/use-events'
import { DashboardCard } from '@/components/shared/dashboard-card'
import { formatDateTime } from '@/utils/date'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'

export function OrganizerReportsPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const statsQuery = useOrganizerStats(user?.id, user?.role === 'admin')

  const stats = statsQuery.data

  return (
    <main className="mx-auto w-full max-w-5xl space-y-6 px-4 py-6 sm:px-6">
      <Button
        variant="ghost"
        className="h-10 rounded-xl px-3 text-muted-foreground hover:text-foreground"
        onClick={() => navigate(-1)}
      >
        <ArrowLeft className="mr-2 size-4" />
        Back
      </Button>

      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">Reports</h1>
        <p className="text-muted-foreground">
          Registration and check-in summary across your events.
        </p>
      </div>

      {statsQuery.isLoading ? (
        <div className="grid gap-3 sm:grid-cols-3">
          <Skeleton className="h-28 rounded-[20px]" />
          <Skeleton className="h-28 rounded-[20px]" />
          <Skeleton className="h-28 rounded-[20px]" />
        </div>
      ) : (
        <section className="grid gap-3 sm:grid-cols-3">
          <DashboardCard
            title="Total registrations"
            value={stats?.totalRegistrations ?? 0}
          />
          <DashboardCard
            title="Total check-ins"
            value={stats?.totalCheckedIn ?? 0}
          />
          <DashboardCard
            title="Overall check-in rate"
            value={`${Math.round((stats?.checkInRate ?? 0) * 100)}%`}
          />
        </section>
      )}

      <section className="space-y-4">
        <h2 className="text-lg font-semibold">Per-event breakdown</h2>

        {statsQuery.isLoading ? (
          <Skeleton className="h-48 rounded-[20px]" />
        ) : (stats?.eventStats.length ?? 0) === 0 ? (
          <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
            <p className="font-medium">No report data yet</p>
            <p className="mt-1 text-sm text-muted-foreground">
              Create and publish events to see reports here.
            </p>
          </div>
        ) : (
          <div className="overflow-hidden rounded-[20px] bg-surface ring-1 ring-border">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Event</TableHead>
                  <TableHead>Registered</TableHead>
                  <TableHead>Checked in</TableHead>
                  <TableHead>Rate</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {stats!.eventStats.map((row) => (
                  <TableRow key={row.event.id}>
                    <TableCell>
                      <Link
                        to={`/organizer/events/${row.event.id}`}
                        className="font-medium text-primary hover:underline"
                      >
                        {row.event.title}
                      </Link>
                      <div className="mt-1 flex flex-wrap items-center gap-2">
                        <Badge variant="outline" className="capitalize">
                          {row.event.status}
                        </Badge>
                        <span className="text-xs text-muted-foreground">
                          {formatDateTime(row.event.start_time)}
                        </span>
                      </div>
                    </TableCell>
                    <TableCell>{row.registered}</TableCell>
                    <TableCell>{row.checkedIn}</TableCell>
                    <TableCell>
                      {Math.round(row.checkInRate * 100)}%
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </div>
        )}
      </section>
    </main>
  )
}

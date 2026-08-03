import { Link, useNavigate, useParams } from 'react-router-dom'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import {
  ArrowLeft,
  CalendarDays,
  Loader2,
  MapPin,
  Pencil,
  Trash2,
  Users,
} from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import {
  eventKeys,
  useEvent,
  useEventAttendanceStats,
  useEventParticipants,
} from '@/hooks/use-events'
import { deleteEvent, updateEvent } from '@/services/events.service'
import { DashboardCard } from '@/components/shared/dashboard-card'
import { AssignVolunteersPanel } from '@/features/volunteers/assign-volunteers-panel'
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

export function OrganizerEventDetailPage() {
  const { eventId } = useParams<{ eventId: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const queryClient = useQueryClient()

  const eventQuery = useEvent(eventId)
  const participantsQuery = useEventParticipants(eventId)
  const statsQuery = useEventAttendanceStats(eventId)

  const publishMutation = useMutation({
    mutationFn: async () => {
      if (!eventId) throw new Error('Missing event')
      return updateEvent(eventId, {
        status: 'published',
        is_registration_open: true,
      })
    },
    onSuccess: async () => {
      toast.success('Event published')
      await invalidateEventQueries()
    },
    onError: (error) => {
      toast.error(error instanceof Error ? error.message : 'Publish failed')
    },
  })

  const deleteMutation = useMutation({
    mutationFn: async () => {
      if (!eventId) throw new Error('Missing event')
      return deleteEvent(eventId)
    },
    onSuccess: async () => {
      toast.success('Event deleted')
      if (user) {
        await Promise.all([
          queryClient.invalidateQueries({
            queryKey: eventKeys.managed(user.id),
          }),
          queryClient.invalidateQueries({
            queryKey: eventKeys.organizerStats(user.id),
          }),
          queryClient.invalidateQueries({
            queryKey: eventKeys.published(),
          }),
        ])
      }
      navigate('/organizer/events', { replace: true })
    },
    onError: (error) => {
      toast.error(error instanceof Error ? error.message : 'Delete failed')
    },
  })

  async function invalidateEventQueries() {
    if (!eventId || !user) return
    await Promise.all([
      queryClient.invalidateQueries({ queryKey: eventKeys.detail(eventId) }),
      queryClient.invalidateQueries({
        queryKey: eventKeys.managed(user.id),
      }),
      queryClient.invalidateQueries({
        queryKey: eventKeys.organizerStats(user.id),
      }),
      queryClient.invalidateQueries({ queryKey: eventKeys.published() }),
    ])
  }

  if (eventQuery.isLoading) {
    return (
      <main className="mx-auto w-full max-w-5xl space-y-4 px-4 py-6 sm:px-6">
        <Skeleton className="h-8 w-40" />
        <Skeleton className="h-40 w-full rounded-[20px]" />
        <Skeleton className="h-64 w-full rounded-[20px]" />
      </main>
    )
  }

  if (!eventQuery.data) {
    return (
      <main className="mx-auto w-full max-w-5xl px-4 py-10 text-center sm:px-6">
        <p className="font-medium">Event not found</p>
        <Button asChild className="mt-4 h-11 rounded-xl">
          <Link to="/organizer/events">Back</Link>
        </Button>
      </main>
    )
  }

  const event = eventQuery.data
  const stats = statsQuery.data
  const participants = participantsQuery.data ?? []

  return (
    <main className="mx-auto w-full max-w-5xl space-y-6 px-4 py-6 sm:px-6">
      <Button
        asChild
        variant="ghost"
        className="h-11 rounded-xl px-3 text-muted-foreground"
      >
        <Link to="/organizer/events">
          <ArrowLeft className="size-4" />
          Events
        </Link>
      </Button>

      <section className="space-y-4 rounded-[20px] bg-surface p-5 ring-1 ring-border sm:p-6">
        <div className="flex flex-wrap items-start justify-between gap-3">
          <div className="space-y-2">
            <div className="flex flex-wrap items-center gap-2">
              <h1 className="text-2xl font-semibold tracking-tight">
                {event.title}
              </h1>
              <Badge variant="secondary" className="capitalize">
                {event.status}
              </Badge>
            </div>
            {event.description ? (
              <p className="max-w-2xl text-muted-foreground">
                {event.description}
              </p>
            ) : null}
          </div>
        </div>

        <div className="space-y-2 text-sm">
          <p className="flex items-center gap-2">
            <CalendarDays className="size-4 text-primary" />
            {formatDateTime(event.start_time)} — {formatDateTime(event.end_time)}
          </p>
          {event.location || event.venue ? (
            <p className="flex items-center gap-2">
              <MapPin className="size-4 text-primary" />
              {[event.venue, event.location].filter(Boolean).join(' · ')}
            </p>
          ) : null}
          <p className="flex items-center gap-2">
            <Users className="size-4 text-primary" />
            Registration{' '}
            {event.is_registration_open ? 'open' : 'closed'}
            {event.capacity ? ` · Capacity ${event.capacity}` : ''}
          </p>
        </div>

        <div className="flex flex-col gap-3 border-t border-border pt-4 sm:flex-row sm:flex-wrap">
          <Button asChild className="h-12 rounded-xl text-base sm:min-w-36">
            <Link to={`/organizer/events/${event.id}/edit`}>
              <Pencil className="size-4" />
              Edit
            </Link>
          </Button>

          {event.status === 'draft' ? (
            <Button
              type="button"
              variant="outline"
              className="h-12 rounded-xl text-base sm:min-w-36"
              disabled={publishMutation.isPending}
              onClick={() => publishMutation.mutate()}
            >
              {publishMutation.isPending ? (
                <>
                  <Loader2 className="size-4 animate-spin" />
                  Publishing…
                </>
              ) : (
                'Publish'
              )}
            </Button>
          ) : null}

          <Button
            type="button"
            variant="destructive"
            className="h-12 rounded-xl text-base sm:min-w-36"
            disabled={deleteMutation.isPending}
            onClick={() => {
              if (
                window.confirm(
                  'Delete this event? Registrations and attendance will also be removed.',
                )
              ) {
                deleteMutation.mutate()
              }
            }}
          >
            {deleteMutation.isPending ? (
              <>
                <Loader2 className="size-4 animate-spin" />
                Deleting…
              </>
            ) : (
              <>
                <Trash2 className="size-4" />
                Delete
              </>
            )}
          </Button>
        </div>
      </section>

      <section className="grid gap-3 sm:grid-cols-3">
        <DashboardCard
          title="Registered"
          value={stats?.registered ?? 0}
          icon={<Users className="size-5 text-primary" />}
        />
        <DashboardCard
          title="Checked in"
          value={stats?.checkedIn ?? 0}
          icon={<Users className="size-5 text-primary" />}
        />
        <DashboardCard
          title="Pending"
          value={stats?.pending ?? 0}
          hint={`${Math.round((stats?.checkInRate ?? 0) * 100)}% checked in`}
        />
      </section>

      <section className="space-y-4">
        <h2 className="text-lg font-semibold">Participants</h2>

        {participantsQuery.isLoading ? (
          <Skeleton className="h-48 rounded-[20px]" />
        ) : participants.length === 0 ? (
          <div className="rounded-[20px] bg-surface px-5 py-8 text-center ring-1 ring-border">
            <p className="font-medium">No participants yet</p>
            <p className="mt-1 text-sm text-muted-foreground">
              Publish the event so participants can register.
            </p>
          </div>
        ) : (
          <div className="overflow-hidden rounded-[20px] bg-surface ring-1 ring-border">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Name</TableHead>
                  <TableHead>USN</TableHead>
                  <TableHead className="hidden sm:table-cell">Email</TableHead>
                  <TableHead>Status</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {participants.map((row) => (
                  <TableRow key={row.id}>
                    <TableCell className="font-medium">
                      {row.users?.full_name ?? '—'}
                      {row.users?.branch ? (
                        <span className="mt-0.5 block text-xs text-muted-foreground sm:hidden">
                          {row.users.branch}
                        </span>
                      ) : null}
                    </TableCell>
                    <TableCell>{row.users?.usn ?? '—'}</TableCell>
                    <TableCell className="hidden sm:table-cell">
                      {row.users?.email ?? '—'}
                    </TableCell>
                    <TableCell>
                      <Badge
                        variant={
                          row.status === 'checked_in' ? 'default' : 'secondary'
                        }
                        className={
                          row.status === 'checked_in'
                            ? 'bg-success text-success-foreground'
                            : 'capitalize'
                        }
                      >
                        {row.status.replace('_', ' ')}
                      </Badge>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </div>
        )}
      </section>

      <AssignVolunteersPanel eventId={event.id} />
    </main>
  )
}

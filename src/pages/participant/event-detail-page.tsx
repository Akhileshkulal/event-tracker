import { Link, useNavigate, useParams } from 'react-router-dom'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import {
  ArrowLeft,
  CalendarDays,
  Loader2,
  MapPin,
  Users,
} from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import {
  eventKeys,
  registrationKeys,
  useEvent,
  useEventRegistrationCount,
  useMyRegistrationForEvent,
} from '@/hooks/use-events'
import {
  cancelRegistration,
  registerForEvent,
} from '@/services/registrations.service'
import { formatDateTime, isEventLive, isEventUpcoming } from '@/utils/date'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function ParticipantEventDetailPage() {
  const { eventId } = useParams<{ eventId: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const queryClient = useQueryClient()

  const eventQuery = useEvent(eventId)
  const countQuery = useEventRegistrationCount(eventId)
  const myRegQuery = useMyRegistrationForEvent(eventId, user?.id)

  const registerMutation = useMutation({
    mutationFn: async () => {
      if (!eventId || !user) throw new Error('Missing event or user')
      return registerForEvent(eventId, user.id)
    },
    onSuccess: async (registration) => {
      toast.success('Registered successfully')
      await Promise.all([
        queryClient.invalidateQueries({
          queryKey: registrationKeys.mine(user!.id),
        }),
        queryClient.invalidateQueries({
          queryKey: registrationKeys.forEvent(eventId!, user!.id),
        }),
        queryClient.invalidateQueries({
          queryKey: eventKeys.count(eventId!),
        }),
      ])
      navigate(`/participant/registrations/${registration.id}`)
    },
    onError: (error) => {
      const message =
        error instanceof Error ? error.message : 'Registration failed'
      if (message.toLowerCase().includes('duplicate')) {
        toast.error('You’re already registered for this event')
      } else {
        toast.error(message)
      }
    },
  })

  const cancelMutation = useMutation({
    mutationFn: async () => {
      if (!myRegQuery.data) throw new Error('No registration found')
      return cancelRegistration(myRegQuery.data.id)
    },
    onSuccess: async () => {
      toast.success('Registration cancelled')
      await Promise.all([
        queryClient.invalidateQueries({
          queryKey: registrationKeys.mine(user!.id),
        }),
        queryClient.invalidateQueries({
          queryKey: registrationKeys.forEvent(eventId!, user!.id),
        }),
        queryClient.invalidateQueries({
          queryKey: eventKeys.count(eventId!),
        }),
      ])
    },
    onError: (error) => {
      toast.error(
        error instanceof Error ? error.message : 'Could not cancel registration',
      )
    },
  })

  if (eventQuery.isLoading) {
    return (
      <main className="mx-auto w-full max-w-3xl space-y-4 px-4 py-6 sm:px-6">
        <Skeleton className="h-8 w-32" />
        <Skeleton className="aspect-[16/9] w-full rounded-[20px]" />
        <Skeleton className="h-10 w-2/3" />
        <Skeleton className="h-24 w-full" />
      </main>
    )
  }

  if (eventQuery.isError || !eventQuery.data) {
    return (
      <main className="mx-auto w-full max-w-3xl px-4 py-10 text-center sm:px-6">
        <p className="font-medium">Event not found</p>
        <Button asChild className="mt-4 h-11 rounded-xl">
          <Link to="/participant/events">Back to events</Link>
        </Button>
      </main>
    )
  }

  const event = eventQuery.data
  const count = countQuery.data ?? 0
  const myReg = myRegQuery.data
  const isFull = event.capacity != null && count >= event.capacity
  const canRegister =
    event.is_registration_open &&
    (event.status === 'published' || event.status === 'ongoing') &&
    !myReg &&
    !isFull
  const live = isEventLive(event.start_time, event.end_time)
  const upcoming = isEventUpcoming(event.start_time)

  return (
    <main className="mx-auto w-full max-w-3xl space-y-6 px-4 py-6 sm:px-6">
      <Button
        asChild
        variant="ghost"
        className="h-11 rounded-xl px-3 text-muted-foreground"
      >
        <Link to="/participant/events">
          <ArrowLeft className="size-4" />
          Events
        </Link>
      </Button>

      <div className="overflow-hidden rounded-[20px] bg-surface ring-1 ring-border">
        <div className="relative aspect-[16/9] bg-gradient-to-br from-accent to-secondary">
          {event.cover_image_url ? (
            <img
              src={event.cover_image_url}
              alt=""
              className="size-full object-cover"
            />
          ) : null}
          <div className="absolute top-3 left-3 flex gap-2">
            {live ? (
              <Badge className="bg-success text-success-foreground">Live</Badge>
            ) : upcoming ? (
              <Badge variant="secondary">Upcoming</Badge>
            ) : (
              <Badge variant="outline">Ended</Badge>
            )}
          </div>
        </div>

        <div className="space-y-5 p-5 sm:p-6">
          <div className="space-y-2">
            <h1 className="text-2xl font-semibold tracking-tight">
              {event.title}
            </h1>
            {event.description ? (
              <p className="whitespace-pre-wrap text-muted-foreground">
                {event.description}
              </p>
            ) : null}
          </div>

          <div className="space-y-3 text-sm">
            <p className="flex items-center gap-2 text-foreground">
              <CalendarDays className="size-4 text-primary" />
              {formatDateTime(event.start_time)} —{' '}
              {formatDateTime(event.end_time)}
            </p>
            {event.location || event.venue ? (
              <p className="flex items-center gap-2 text-foreground">
                <MapPin className="size-4 text-primary" />
                {[event.venue, event.location].filter(Boolean).join(' · ')}
              </p>
            ) : null}
            <p className="flex items-center gap-2 text-foreground">
              <Users className="size-4 text-primary" />
              {count}
              {event.capacity ? ` / ${event.capacity}` : ''} registered
              {isFull ? ' · Full' : ''}
            </p>
          </div>

          <div className="flex flex-col gap-3 border-t border-border pt-5 sm:flex-row">
            {myReg ? (
              <>
                <Button asChild className="h-12 flex-1 rounded-xl text-base">
                  <Link to={`/participant/registrations/${myReg.id}`}>
                    View my QR
                  </Link>
                </Button>
                {myReg.status === 'registered' ? (
                  <Button
                    type="button"
                    variant="outline"
                    className="h-12 flex-1 rounded-xl text-base"
                    disabled={cancelMutation.isPending}
                    onClick={() => cancelMutation.mutate()}
                  >
                    {cancelMutation.isPending ? (
                      <>
                        <Loader2 className="size-4 animate-spin" />
                        Cancelling…
                      </>
                    ) : (
                      'Cancel registration'
                    )}
                  </Button>
                ) : null}
              </>
            ) : (
              <Button
                type="button"
                className="h-12 w-full rounded-xl text-base"
                disabled={!canRegister || registerMutation.isPending}
                onClick={() => registerMutation.mutate()}
              >
                {registerMutation.isPending ? (
                  <>
                    <Loader2 className="size-4 animate-spin" />
                    Registering…
                  </>
                ) : !event.is_registration_open ? (
                  'Registration closed'
                ) : isFull ? (
                  'Event is full'
                ) : (
                  'Register for event'
                )}
              </Button>
            )}
          </div>
        </div>
      </div>
    </main>
  )
}

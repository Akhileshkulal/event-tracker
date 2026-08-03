import { useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { useQueryClient } from '@tanstack/react-query'
import { ArrowLeft } from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import { eventKeys, useEvent } from '@/hooks/use-events'
import { updateEvent } from '@/services/events.service'
import { EventForm } from '@/features/events/event-form'
import {
  fromDateTimeLocalValue,
  toDateTimeLocalValue,
  type EventFormValues,
} from '@/features/events/schemas'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function OrganizerEditEventPage() {
  const { eventId } = useParams<{ eventId: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const queryClient = useQueryClient()
  const eventQuery = useEvent(eventId)
  const [submitting, setSubmitting] = useState(false)

  async function handleSubmit(values: EventFormValues) {
    if (!eventId || !user) return
    setSubmitting(true)
    try {
      await updateEvent(eventId, {
        title: values.title,
        description: values.description || null,
        location: values.location || null,
        venue: values.venue || null,
        start_time: fromDateTimeLocalValue(values.start_time),
        end_time: fromDateTimeLocalValue(values.end_time),
        capacity: values.capacity ? Number(values.capacity) : null,
        cover_image_url: values.cover_image_url || null,
        status: values.status,
        is_registration_open: values.is_registration_open,
      })

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

      toast.success('Event updated')
      navigate(`/organizer/events/${eventId}`, { replace: true })
    } catch (error) {
      toast.error(
        error instanceof Error ? error.message : 'Could not update event',
      )
    } finally {
      setSubmitting(false)
    }
  }

  if (eventQuery.isLoading) {
    return (
      <main className="mx-auto w-full max-w-2xl space-y-4 px-4 py-6 sm:px-6">
        <Skeleton className="h-8 w-32" />
        <Skeleton className="h-96 w-full rounded-[20px]" />
      </main>
    )
  }

  if (!eventQuery.data) {
    return (
      <main className="mx-auto w-full max-w-2xl px-4 py-10 text-center sm:px-6">
        <p className="font-medium">Event not found</p>
        <Button asChild className="mt-4 h-11 rounded-xl">
          <Link to="/organizer/events">Back</Link>
        </Button>
      </main>
    )
  }

  const event = eventQuery.data

  return (
    <main className="mx-auto w-full max-w-2xl space-y-6 px-4 py-6 sm:px-6">
      <Button
        asChild
        variant="ghost"
        className="h-11 rounded-xl px-3 text-muted-foreground"
      >
        <Link to={`/organizer/events/${event.id}`}>
          <ArrowLeft className="size-4" />
          Back to event
        </Link>
      </Button>

      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">Edit event</h1>
        <p className="text-muted-foreground">{event.title}</p>
      </div>

      <div className="rounded-[20px] bg-surface p-5 ring-1 ring-border sm:p-6">
        <EventForm
          key={event.id}
          submitLabel="Save changes"
          isSubmitting={submitting}
          onSubmit={handleSubmit}
          defaultValues={{
            title: event.title,
            description: event.description ?? '',
            location: event.location ?? '',
            venue: event.venue ?? '',
            start_time: toDateTimeLocalValue(event.start_time),
            end_time: toDateTimeLocalValue(event.end_time),
            capacity: event.capacity?.toString() ?? '',
            cover_image_url: event.cover_image_url ?? '',
            status: event.status,
            is_registration_open: event.is_registration_open,
          }}
        />
      </div>
    </main>
  )
}

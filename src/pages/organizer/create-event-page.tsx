import { useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useQueryClient } from '@tanstack/react-query'
import { ArrowLeft } from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import { eventKeys } from '@/hooks/use-events'
import { createEvent } from '@/services/events.service'
import { EventForm } from '@/features/events/event-form'
import {
  fromDateTimeLocalValue,
  toDateTimeLocalValue,
  type EventFormValues,
} from '@/features/events/schemas'
import { Button } from '@/components/ui/button'

function defaultStart() {
  const date = new Date()
  date.setHours(date.getHours() + 24, 0, 0, 0)
  return toDateTimeLocalValue(date.toISOString())
}

function defaultEnd() {
  const date = new Date()
  date.setHours(date.getHours() + 28, 0, 0, 0)
  return toDateTimeLocalValue(date.toISOString())
}

export function OrganizerCreateEventPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const queryClient = useQueryClient()
  const [submitting, setSubmitting] = useState(false)

  async function handleSubmit(values: EventFormValues) {
    if (!user) return
    setSubmitting(true)
    try {
      const event = await createEvent({
        title: values.title,
        description: values.description || null,
        location: values.location || null,
        venue: values.venue || null,
        start_time: fromDateTimeLocalValue(values.start_time),
        end_time: fromDateTimeLocalValue(values.end_time),
        capacity: values.capacity ? Number(values.capacity) : null,
        cover_image_url: values.cover_image_url || null,
        organizer_id: user.id,
        status: values.status,
        is_registration_open: values.is_registration_open,
      })

      await queryClient.invalidateQueries({
        queryKey: eventKeys.managed(user.id),
      })
      await queryClient.invalidateQueries({
        queryKey: eventKeys.organizerStats(user.id),
      })
      await queryClient.invalidateQueries({
        queryKey: eventKeys.published(),
      })

      toast.success('Event created')
      navigate(`/organizer/events/${event.id}`, { replace: true })
    } catch (error) {
      toast.error(
        error instanceof Error ? error.message : 'Could not create event',
      )
    } finally {
      setSubmitting(false)
    }
  }

  return (
    <main className="mx-auto w-full max-w-2xl space-y-6 px-4 py-6 sm:px-6">
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

      <div className="space-y-2">
        <h1 className="text-2xl font-semibold tracking-tight">Create event</h1>
        <p className="text-muted-foreground">
          Save as draft or publish so participants can register.
        </p>
      </div>

      <div className="rounded-[20px] bg-surface p-5 ring-1 ring-border sm:p-6">
        <EventForm
          submitLabel="Create event"
          isSubmitting={submitting}
          onSubmit={handleSubmit}
          defaultValues={{
            title: '',
            description: '',
            location: '',
            venue: '',
            start_time: defaultStart(),
            end_time: defaultEnd(),
            capacity: '',
            cover_image_url: '',
            status: 'draft',
            is_registration_open: true,
          }}
        />
      </div>
    </main>
  )
}

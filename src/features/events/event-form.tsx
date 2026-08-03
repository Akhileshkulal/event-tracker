import { Controller, useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { Loader2 } from 'lucide-react'
import {
  eventFormSchema,
  type EventFormValues,
} from '@/features/events/schemas'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Switch } from '@/components/ui/switch'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

type EventFormProps = {
  defaultValues: EventFormValues
  submitLabel: string
  onSubmit: (values: EventFormValues) => Promise<void>
  isSubmitting?: boolean
}

export function EventForm({
  defaultValues,
  submitLabel,
  onSubmit,
  isSubmitting = false,
}: EventFormProps) {
  const {
    register,
    control,
    handleSubmit,
    formState: { errors },
  } = useForm<EventFormValues>({
    resolver: zodResolver(eventFormSchema),
    defaultValues,
  })

  return (
    <form
      className="space-y-5"
      onSubmit={handleSubmit(async (values) => {
        await onSubmit(values)
      })}
      noValidate
    >
      <div className="space-y-2">
        <Label htmlFor="title">Title</Label>
        <Input
          id="title"
          placeholder="Tech Fest 2026"
          className="h-12 rounded-xl text-base"
          aria-invalid={Boolean(errors.title)}
          {...register('title')}
        />
        {errors.title ? (
          <p className="text-sm text-danger">{errors.title.message}</p>
        ) : null}
      </div>

      <div className="space-y-2">
        <Label htmlFor="description">Description</Label>
        <Textarea
          id="description"
          placeholder="What is this event about?"
          className="min-h-28 rounded-xl text-base"
          {...register('description')}
        />
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <div className="space-y-2">
          <Label htmlFor="venue">Venue</Label>
          <Input
            id="venue"
            placeholder="Auditorium Hall A"
            className="h-12 rounded-xl text-base"
            {...register('venue')}
          />
        </div>
        <div className="space-y-2">
          <Label htmlFor="location">Location / Campus</Label>
          <Input
            id="location"
            placeholder="Main Campus"
            className="h-12 rounded-xl text-base"
            {...register('location')}
          />
        </div>
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <div className="space-y-2">
          <Label htmlFor="start_time">Start</Label>
          <Input
            id="start_time"
            type="datetime-local"
            className="h-12 rounded-xl text-base"
            aria-invalid={Boolean(errors.start_time)}
            {...register('start_time')}
          />
          {errors.start_time ? (
            <p className="text-sm text-danger">{errors.start_time.message}</p>
          ) : null}
        </div>
        <div className="space-y-2">
          <Label htmlFor="end_time">End</Label>
          <Input
            id="end_time"
            type="datetime-local"
            className="h-12 rounded-xl text-base"
            aria-invalid={Boolean(errors.end_time)}
            {...register('end_time')}
          />
          {errors.end_time ? (
            <p className="text-sm text-danger">{errors.end_time.message}</p>
          ) : null}
        </div>
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <div className="space-y-2">
          <Label htmlFor="capacity">Capacity (optional)</Label>
          <Input
            id="capacity"
            type="number"
            min={1}
            placeholder="200"
            className="h-12 rounded-xl text-base"
            aria-invalid={Boolean(errors.capacity)}
            {...register('capacity')}
          />
          {errors.capacity ? (
            <p className="text-sm text-danger">{errors.capacity.message}</p>
          ) : null}
        </div>
        <div className="space-y-2">
          <Label htmlFor="status">Status</Label>
          <Controller
            control={control}
            name="status"
            render={({ field }) => (
              <Select value={field.value} onValueChange={field.onChange}>
                <SelectTrigger
                  id="status"
                  className="h-12 w-full rounded-xl text-base"
                >
                  <SelectValue placeholder="Status" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="draft">Draft</SelectItem>
                  <SelectItem value="published">Published</SelectItem>
                  <SelectItem value="ongoing">Ongoing</SelectItem>
                  <SelectItem value="completed">Completed</SelectItem>
                  <SelectItem value="cancelled">Cancelled</SelectItem>
                </SelectContent>
              </Select>
            )}
          />
        </div>
      </div>

      <div className="space-y-2">
        <Label htmlFor="cover_image_url">Cover image URL (optional)</Label>
        <Input
          id="cover_image_url"
          type="url"
          placeholder="https://…"
          className="h-12 rounded-xl text-base"
          aria-invalid={Boolean(errors.cover_image_url)}
          {...register('cover_image_url')}
        />
        {errors.cover_image_url ? (
          <p className="text-sm text-danger">
            {errors.cover_image_url.message}
          </p>
        ) : null}
      </div>

      <Controller
        control={control}
        name="is_registration_open"
        render={({ field }) => (
          <div className="flex items-center justify-between gap-4 rounded-xl bg-muted/60 px-4 py-3">
            <div>
              <p className="text-sm font-medium">Registration open</p>
              <p className="text-xs text-muted-foreground">
                Participants can register while this is on
              </p>
            </div>
            <Switch
              checked={field.value}
              onCheckedChange={field.onChange}
              aria-label="Registration open"
            />
          </div>
        )}
      />

      <Button
        type="submit"
        disabled={isSubmitting}
        className="h-12 w-full rounded-xl text-base"
      >
        {isSubmitting ? (
          <>
            <Loader2 className="size-4 animate-spin" />
            Saving…
          </>
        ) : (
          submitLabel
        )}
      </Button>
    </form>
  )
}

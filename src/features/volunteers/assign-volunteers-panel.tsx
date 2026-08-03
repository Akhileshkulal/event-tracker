import { useState, type FormEvent } from 'react'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import { Loader2, UserPlus, X } from 'lucide-react'
import { toast } from 'sonner'
import { useAuth } from '@/contexts/auth-context'
import { volunteerKeys, useEventVolunteers } from '@/hooks/use-volunteers'
import {
  assignVolunteerToEvent,
  removeVolunteerFromEvent,
  searchVolunteers,
} from '@/services/volunteers.service'
import type { User } from '@/types'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Skeleton } from '@/components/ui/skeleton'

type AssignVolunteersPanelProps = {
  eventId: string
}

export function AssignVolunteersPanel({ eventId }: AssignVolunteersPanelProps) {
  const { user } = useAuth()
  const queryClient = useQueryClient()
  const volunteersQuery = useEventVolunteers(eventId)

  const [query, setQuery] = useState('')
  const [results, setResults] = useState<User[]>([])
  const [searching, setSearching] = useState(false)

  const assignMutation = useMutation({
    mutationFn: async (volunteerId: string) => {
      if (!user) throw new Error('Not authenticated')
      return assignVolunteerToEvent({
        event_id: eventId,
        volunteer_id: volunteerId,
        assigned_by: user.id,
      })
    },
    onSuccess: async () => {
      toast.success('Volunteer assigned')
      setQuery('')
      setResults([])
      await queryClient.invalidateQueries({
        queryKey: volunteerKeys.eventVolunteers(eventId),
      })
    },
    onError: (error) => {
      const message =
        error instanceof Error ? error.message : 'Could not assign volunteer'
      if (message.toLowerCase().includes('duplicate')) {
        toast.error('Volunteer is already assigned')
      } else {
        toast.error(message)
      }
    },
  })

  const removeMutation = useMutation({
    mutationFn: removeVolunteerFromEvent,
    onSuccess: async () => {
      toast.success('Volunteer removed')
      await queryClient.invalidateQueries({
        queryKey: volunteerKeys.eventVolunteers(eventId),
      })
    },
    onError: (error) => {
      toast.error(
        error instanceof Error ? error.message : 'Could not remove volunteer',
      )
    },
  })

  async function handleSearch(e: FormEvent) {
    e.preventDefault()
    setSearching(true)
    try {
      const users = await searchVolunteers(query)
      setResults(users)
      if (users.length === 0) {
        toast.message('No volunteers found', {
          description: 'Volunteers must register with the volunteer role.',
        })
      }
    } catch (error) {
      toast.error(
        error instanceof Error ? error.message : 'Search failed',
      )
    } finally {
      setSearching(false)
    }
  }

  return (
    <section className="space-y-4">
      <h2 className="text-lg font-semibold">Volunteers</h2>

      <form
        onSubmit={handleSearch}
        className="flex flex-col gap-3 sm:flex-row"
      >
        <Input
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search volunteer by name or email"
          className="h-12 rounded-xl text-base"
        />
        <Button
          type="submit"
          disabled={searching || !query.trim()}
          className="h-12 rounded-xl sm:min-w-32"
        >
          {searching ? (
            <Loader2 className="size-4 animate-spin" />
          ) : (
            <>
              <UserPlus className="size-4" />
              Search
            </>
          )}
        </Button>
      </form>

      {results.length > 0 ? (
        <ul className="space-y-2">
          {results.map((volunteer) => (
            <li
              key={volunteer.id}
              className="flex items-center justify-between gap-3 rounded-xl bg-muted/50 px-3 py-3"
            >
              <div className="min-w-0">
                <p className="truncate font-medium">{volunteer.full_name}</p>
                <p className="truncate text-sm text-muted-foreground">
                  {volunteer.email}
                </p>
              </div>
              <Button
                type="button"
                size="sm"
                className="h-10 rounded-xl"
                disabled={assignMutation.isPending}
                onClick={() => assignMutation.mutate(volunteer.id)}
              >
                Assign
              </Button>
            </li>
          ))}
        </ul>
      ) : null}

      {volunteersQuery.isLoading ? (
        <Skeleton className="h-24 rounded-[20px]" />
      ) : (volunteersQuery.data?.length ?? 0) === 0 ? (
        <div className="rounded-[20px] bg-surface px-5 py-6 text-center ring-1 ring-border">
          <p className="text-sm text-muted-foreground">
            No volunteers assigned to this event yet.
          </p>
        </div>
      ) : (
        <ul className="space-y-2">
          {volunteersQuery.data!.map((row) => (
            <li
              key={row.id}
              className="flex items-center justify-between gap-3 rounded-[20px] bg-surface px-4 py-3 ring-1 ring-border"
            >
              <div className="min-w-0">
                <p className="truncate font-medium">
                  {row.users?.full_name ?? 'Volunteer'}
                </p>
                <p className="truncate text-sm text-muted-foreground">
                  {row.users?.email}
                </p>
              </div>
              <Button
                type="button"
                variant="ghost"
                size="icon"
                className="size-10 rounded-xl"
                disabled={removeMutation.isPending}
                onClick={() => removeMutation.mutate(row.id)}
                aria-label="Remove volunteer"
              >
                <X className="size-4" />
              </Button>
            </li>
          ))}
        </ul>
      )}
    </section>
  )
}

import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { Bell, Check, CheckCheck, Inbox } from 'lucide-react'
import { useAuth } from '@/contexts/auth-context'
import {
  listUserNotifications,
  markAllNotificationsRead,
  markNotificationRead,
} from '@/services/notifications.service'
import { formatDateTime } from '@/utils/date'
import { Button } from '@/components/ui/button'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { cn } from '@/lib/utils'

export function NotificationBell() {
  const { user } = useAuth()
  const queryClient = useQueryClient()

  const notificationsQuery = useQuery({
    queryKey: ['notifications', user?.id],
    queryFn: () => (user?.id ? listUserNotifications(user.id) : []),
    enabled: Boolean(user?.id),
    refetchInterval: 15_000,
  })

  const markReadMutation = useMutation({
    mutationFn: (notificationId: string) => markNotificationRead(notificationId),
    onSuccess: () => {
      void queryClient.invalidateQueries({ queryKey: ['notifications', user?.id] })
    },
  })

  const markAllMutation = useMutation({
    mutationFn: () => (user?.id ? markAllNotificationsRead(user.id) : Promise.resolve()),
    onSuccess: () => {
      void queryClient.invalidateQueries({ queryKey: ['notifications', user?.id] })
    },
  })

  const notifications = notificationsQuery.data ?? []
  const unreadCount = notifications.filter((n) => !n.is_read).length

  if (!user) return null

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button
          variant="ghost"
          size="icon"
          className="relative size-10 rounded-xl"
          aria-label="Notifications"
        >
          <Bell className="size-5 text-foreground" />
          {unreadCount > 0 ? (
            <span className="absolute top-1.5 right-1.5 flex size-4 items-center justify-center rounded-full bg-primary text-[10px] font-bold text-primary-foreground">
              {unreadCount > 9 ? '9+' : unreadCount}
            </span>
          ) : null}
        </Button>
      </DropdownMenuTrigger>

      <DropdownMenuContent
        align="end"
        className="w-80 sm:w-96 rounded-2xl p-2 shadow-xl ring-1 ring-border"
      >
        <div className="flex items-center justify-between px-3 py-2 border-b border-border">
          <div className="flex items-center gap-2">
            <h3 className="font-semibold text-sm">Notifications</h3>
            {unreadCount > 0 ? (
              <span className="rounded-md bg-primary/10 px-2 py-0.5 text-xs font-semibold text-primary">
                {unreadCount} new
              </span>
            ) : null}
          </div>

          {unreadCount > 0 ? (
            <Button
              variant="ghost"
              size="sm"
              className="h-7 text-xs gap-1 text-muted-foreground hover:text-foreground"
              disabled={markAllMutation.isPending}
              onClick={() => markAllMutation.mutate()}
            >
              <CheckCheck className="size-3.5" />
              Mark all read
            </Button>
          ) : null}
        </div>

        <div className="max-h-80 overflow-y-auto py-1">
          {notificationsQuery.isLoading ? (
            <p className="p-4 text-center text-xs text-muted-foreground">
              Loading notifications...
            </p>
          ) : notifications.length === 0 ? (
            <div className="flex flex-col items-center justify-center p-6 text-center">
              <Inbox className="size-8 text-muted-foreground/50 mb-2" />
              <p className="text-sm font-medium">No notifications yet</p>
              <p className="text-xs text-muted-foreground mt-0.5">
                Updates about registrations and events will appear here.
              </p>
            </div>
          ) : (
            notifications.map((item) => (
              <DropdownMenuItem
                key={item.id}
                className={cn(
                  'flex flex-col items-start gap-1 p-3 rounded-xl cursor-pointer focus:bg-accent',
                  !item.is_read && 'bg-accent/40 font-medium',
                )}
                onClick={() => {
                  if (!item.is_read) {
                    markReadMutation.mutate(item.id)
                  }
                }}
              >
                <div className="flex w-full items-center justify-between gap-2">
                  <span className="text-xs font-semibold text-foreground">
                    {item.title}
                  </span>
                  {!item.is_read ? (
                    <span className="size-2 rounded-full bg-primary shrink-0" />
                  ) : (
                    <Check className="size-3 text-muted-foreground shrink-0" />
                  )}
                </div>
                <p className="text-xs text-muted-foreground leading-relaxed">
                  {item.message}
                </p>
                <span className="text-[10px] text-muted-foreground/80 pt-1">
                  {formatDateTime(item.created_at)}
                </span>
              </DropdownMenuItem>
            ))
          )}
        </div>
      </DropdownMenuContent>
    </DropdownMenu>
  )
}

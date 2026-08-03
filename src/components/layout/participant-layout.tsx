import { NavLink, Outlet } from 'react-router-dom'
import { CalendarDays, Home, QrCode, UserRound } from 'lucide-react'
import { AppNavbar } from '@/components/layout/app-navbar'
import { cn } from '@/lib/utils'

const navItems = [
  { to: '/participant', label: 'Home', icon: Home, end: true },
  { to: '/participant/events', label: 'Events', icon: CalendarDays },
  { to: '/participant/registrations', label: 'My QR', icon: QrCode },
  { to: '/profile', label: 'Profile', icon: UserRound },
]

export function ParticipantLayout() {
  return (
    <div className="min-h-dvh bg-background pb-24">
      <AppNavbar />
      <Outlet />

      <nav className="fixed inset-x-0 bottom-0 z-40 border-t border-border bg-surface/95 backdrop-blur-md safe-area-pb">
        <ul className="mx-auto grid max-w-lg grid-cols-4 px-2 py-2">
          {navItems.map((item) => {
            const Icon = item.icon
            return (
              <li key={item.to}>
                <NavLink
                  to={item.to}
                  end={item.end}
                  className={({ isActive }) =>
                    cn(
                      'flex min-h-14 flex-col items-center justify-center gap-1 rounded-xl px-2 text-xs font-medium transition',
                      isActive
                        ? 'bg-accent text-primary'
                        : 'text-muted-foreground hover:text-foreground',
                    )
                  }
                >
                  <Icon className="size-5" />
                  {item.label}
                </NavLink>
              </li>
            )
          })}
        </ul>
      </nav>
    </div>
  )
}

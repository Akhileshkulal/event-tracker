import type { ReactNode } from 'react'
import { cn } from '@/lib/utils'

type DashboardCardProps = {
  title: string
  value: string | number
  hint?: string
  icon?: ReactNode
  className?: string
}

export function DashboardCard({
  title,
  value,
  hint,
  icon,
  className,
}: DashboardCardProps) {
  return (
    <div
      className={cn(
        'rounded-[20px] bg-surface p-4 ring-1 ring-border sm:p-5',
        className,
      )}
    >
      <div className="flex items-start justify-between gap-3">
        <div className="space-y-2">
          <p className="text-sm text-muted-foreground">{title}</p>
          <p className="text-2xl font-semibold tracking-tight text-foreground">
            {value}
          </p>
          {hint ? (
            <p className="text-xs text-muted-foreground">{hint}</p>
          ) : null}
        </div>
        {icon ? (
          <div className="flex size-10 shrink-0 items-center justify-center rounded-xl bg-accent">
            {icon}
          </div>
        ) : null}
      </div>
    </div>
  )
}

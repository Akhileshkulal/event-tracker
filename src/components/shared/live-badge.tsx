import { Radio } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/utils'

type LiveBadgeProps = {
  isLive: boolean
  className?: string
}

export function LiveBadge({ isLive, className }: LiveBadgeProps) {
  return (
    <Badge
      variant={isLive ? 'default' : 'secondary'}
      className={cn(
        'gap-1.5 rounded-full px-2.5 py-1',
        isLive && 'bg-success text-success-foreground',
        className,
      )}
    >
      <Radio className={cn('size-3', isLive && 'animate-pulse')} />
      {isLive ? 'Live' : 'Connecting…'}
    </Badge>
  )
}

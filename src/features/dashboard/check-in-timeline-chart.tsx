import {
  Area,
  AreaChart,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import type { CheckInTimelinePoint } from '@/services/analytics.service'
import { cn } from '@/lib/utils'

type CheckInTimelineChartProps = {
  data: CheckInTimelinePoint[]
  className?: string
}

export function CheckInTimelineChart({
  data,
  className,
}: CheckInTimelineChartProps) {
  if (data.length === 0) {
    return (
      <div
        className={cn(
          'flex h-56 items-center justify-center rounded-[20px] bg-surface ring-1 ring-border',
          className,
        )}
      >
        <p className="text-sm text-muted-foreground">
          Check-ins will appear here in real time
        </p>
      </div>
    )
  }

  return (
    <div
      className={cn(
        'h-56 rounded-[20px] bg-surface p-4 ring-1 ring-border sm:p-5',
        className,
      )}
    >
      <ResponsiveContainer width="100%" height="100%">
        <AreaChart data={data} margin={{ top: 8, right: 8, left: -16, bottom: 0 }}>
          <defs>
            <linearGradient id="checkInFill" x1="0" y1="0" x2="0" y2="1">
              <stop offset="5%" stopColor="#2563EB" stopOpacity={0.35} />
              <stop offset="95%" stopColor="#2563EB" stopOpacity={0.02} />
            </linearGradient>
          </defs>
          <CartesianGrid strokeDasharray="3 3" stroke="#E2E8F0" vertical={false} />
          <XAxis
            dataKey="label"
            tick={{ fontSize: 12, fill: '#64748B' }}
            interval="preserveStartEnd"
          />
          <YAxis tick={{ fontSize: 12, fill: '#64748B' }} allowDecimals={false} />
          <Tooltip
            contentStyle={{
              borderRadius: 12,
              borderColor: '#E2E8F0',
              fontSize: 13,
            }}
          />
          <Area
            type="monotone"
            dataKey="cumulative"
            name="Total checked in"
            stroke="#2563EB"
            fill="url(#checkInFill)"
            strokeWidth={2}
          />
        </AreaChart>
      </ResponsiveContainer>
    </div>
  )
}

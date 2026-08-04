import {
  Bar,
  BarChart,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from 'recharts'
import { cn } from '@/lib/utils'

type EventStatRow = {
  name: string
  registered: number
  checkedIn: number
  pending: number
}

type CheckInRateChartProps = {
  data: EventStatRow[]
  className?: string
}

export function CheckInRateChart({ data, className }: CheckInRateChartProps) {
  if (data.length === 0) {
    return (
      <div
        className={cn(
          'flex h-64 items-center justify-center rounded-[20px] bg-surface ring-1 ring-border',
          className,
        )}
      >
        <p className="text-sm text-muted-foreground">No chart data yet</p>
      </div>
    )
  }

  return (
    <div
      className={cn(
        'h-72 rounded-[20px] bg-surface p-4 ring-1 ring-border sm:p-5',
        className,
      )}
    >
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={data} margin={{ top: 8, right: 8, left: -16, bottom: 0 }}>
          <CartesianGrid strokeDasharray="3 3" stroke="#E2E8F0" vertical={false} />
          <XAxis
            dataKey="name"
            tick={{ fontSize: 12, fill: '#64748B' }}
            interval={0}
            angle={-20}
            textAnchor="end"
            height={56}
          />
          <YAxis tick={{ fontSize: 12, fill: '#64748B' }} allowDecimals={false} />
          <Tooltip
            contentStyle={{
              borderRadius: 12,
              borderColor: '#E2E8F0',
              fontSize: 13,
            }}
          />
          <Bar dataKey="checkedIn" name="Checked in" fill="#22C55E" radius={[6, 6, 0, 0]} />
          <Bar dataKey="pending" name="Pending" fill="#2563EB" radius={[6, 6, 0, 0]} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

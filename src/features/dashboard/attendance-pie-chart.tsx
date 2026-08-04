import {
  Cell,
  Pie,
  PieChart,
  ResponsiveContainer,
  Tooltip,
} from 'recharts'
import { cn } from '@/lib/utils'

type AttendancePieChartProps = {
  checkedIn: number
  pending: number
  className?: string
}

const COLORS = ['#22C55E', '#2563EB']

export function AttendancePieChart({
  checkedIn,
  pending,
  className,
}: AttendancePieChartProps) {
  const data = [
    { name: 'Checked in', value: checkedIn },
    { name: 'Pending', value: pending },
  ].filter((item) => item.value > 0)

  if (data.length === 0) {
    return (
      <div
        className={cn(
          'flex h-56 items-center justify-center rounded-[20px] bg-surface ring-1 ring-border',
          className,
        )}
      >
        <p className="text-sm text-muted-foreground">No attendance data yet</p>
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
        <PieChart>
          <Pie
            data={data}
            dataKey="value"
            nameKey="name"
            innerRadius={52}
            outerRadius={78}
            paddingAngle={3}
          >
            {data.map((entry, index) => (
              <Cell key={entry.name} fill={COLORS[index % COLORS.length]} />
            ))}
          </Pie>
          <Tooltip
            contentStyle={{
              borderRadius: 12,
              borderColor: '#E2E8F0',
              fontSize: 13,
            }}
          />
        </PieChart>
      </ResponsiveContainer>
    </div>
  )
}

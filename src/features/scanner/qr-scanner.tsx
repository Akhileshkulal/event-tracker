import { useCallback, useEffect, useId, useRef, useState } from 'react'
import {
  Html5Qrcode,
  Html5QrcodeSupportedFormats,
} from 'html5-qrcode'
import { Camera, CameraOff, Loader2 } from 'lucide-react'
import { parseQrPayload } from '@/utils/qr'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'

type QrScannerProps = {
  onScan: (token: string) => void
  onError?: (message: string) => void
  className?: string
  paused?: boolean
}

export function QrScanner({
  onScan,
  onError,
  className,
  paused = false,
}: QrScannerProps) {
  const containerId = useId().replace(/:/g, '')
  const scannerRef = useRef<Html5Qrcode | null>(null)
  const lastScanRef = useRef<{ token: string; at: number } | null>(null)

  const [status, setStatus] = useState<
    'idle' | 'starting' | 'scanning' | 'error'
  >('idle')
  const [errorMessage, setErrorMessage] = useState<string | null>(null)

  const stopScanner = useCallback(async () => {
    const scanner = scannerRef.current
    scannerRef.current = null
    if (!scanner) return

    try {
      if (scanner.isScanning) {
        await scanner.stop()
      }
      scanner.clear()
    } catch {
      // ignore cleanup errors
    }
  }, [])

  const startScanner = useCallback(async () => {
    setErrorMessage(null)
    setStatus('starting')

    try {
      await stopScanner()

      const scanner = new Html5Qrcode(containerId, {
        formatsToSupport: [Html5QrcodeSupportedFormats.QR_CODE],
        verbose: false,
      })
      scannerRef.current = scanner

      const qrboxSize = Math.min(
        Math.floor(window.innerWidth * 0.72),
        280,
      )

      await scanner.start(
        { facingMode: 'environment' },
        {
          fps: 10,
          qrbox: { width: qrboxSize, height: qrboxSize },
          aspectRatio: 1,
        },
        (decodedText) => {
          if (paused) return

          const token = parseQrPayload(decodedText)
          if (!token) return

          const now = Date.now()
          const last = lastScanRef.current
          if (last && last.token === token && now - last.at < 2500) {
            return
          }
          lastScanRef.current = { token, at: now }
          onScan(token)
        },
        () => {
          // frame-level decode misses are expected
        },
      )

      setStatus('scanning')
    } catch (error) {
      const message =
        error instanceof Error
          ? error.message
          : 'Could not access the camera'
      setErrorMessage(message)
      setStatus('error')
      onError?.(message)
    }
  }, [containerId, onError, onScan, paused, stopScanner])

  useEffect(() => {
    if (paused && status === 'scanning') {
      void stopScanner().then(() => setStatus('idle'))
    }
  }, [paused, status, stopScanner])

  useEffect(() => {
    return () => {
      void stopScanner()
    }
  }, [stopScanner])

  const isActive = status === 'scanning' || status === 'starting'

  return (
    <div className={cn('space-y-4', className)}>
      <div
        className={cn(
          'relative overflow-hidden rounded-[20px] bg-black ring-1 ring-border',
          isActive ? 'min-h-[320px]' : 'min-h-[220px]',
        )}
      >
        <div
          id={containerId}
          className="qr-scanner-viewport size-full min-h-[inherit]"
        />

        {!isActive ? (
          <div className="absolute inset-0 flex flex-col items-center justify-center gap-3 bg-muted/90 px-6 text-center">
            <div className="flex size-14 items-center justify-center rounded-2xl bg-accent">
              <Camera className="size-7 text-primary" />
            </div>
            <p className="text-sm font-medium text-foreground">
              Camera is off
            </p>
            <p className="text-xs text-muted-foreground">
              Allow camera access when prompted. Works best on mobile over
              HTTPS.
            </p>
          </div>
        ) : null}

        {status === 'starting' ? (
          <div className="absolute inset-0 flex items-center justify-center bg-black/40">
            <Loader2 className="size-8 animate-spin text-white" />
          </div>
        ) : null}
      </div>

      {errorMessage ? (
        <p className="rounded-xl bg-destructive/10 px-3 py-2 text-sm text-destructive">
          {errorMessage}
        </p>
      ) : null}

      <div className="grid grid-cols-2 gap-3">
        <Button
          type="button"
          className="h-12 rounded-xl text-base"
          disabled={isActive}
          onClick={() => void startScanner()}
        >
          <Camera className="size-4" />
          Start camera
        </Button>
        <Button
          type="button"
          variant="outline"
          className="h-12 rounded-xl text-base"
          disabled={!isActive}
          onClick={() => {
            void stopScanner().then(() => {
              setStatus('idle')
              setErrorMessage(null)
            })
          }}
        >
          <CameraOff className="size-4" />
          Stop
        </Button>
      </div>
    </div>
  )
}

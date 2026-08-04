import QRCode from 'qrcode'
import { buildQrPayload } from '@/utils/qr'

export type GenerateQrOptions = {
  width?: number
  margin?: number
  darkColor?: string
  lightColor?: string
}

export async function generateQrDataUrl(
  qrToken: string,
  options: GenerateQrOptions = {},
) {
  const {
    width = 512,
    margin = 2,
    darkColor = '#0F172A',
    lightColor = '#FFFFFF',
  } = options

  const payload = buildQrPayload(qrToken)

  return QRCode.toDataURL(payload, {
    errorCorrectionLevel: 'M',
    margin,
    width,
    color: {
      dark: darkColor,
      light: lightColor,
    },
  })
}

export async function downloadQrPng(
  dataUrl: string,
  filename = 'eventtrack-checkin-qr.png',
) {
  const link = document.createElement('a')
  link.href = dataUrl
  link.download = filename
  link.click()
}

export async function shareQrImage(options: {
  dataUrl: string
  title: string
  text?: string
}) {
  const { dataUrl, title, text } = options

  if (!navigator.share) {
    throw new Error('Sharing is not supported on this device')
  }

  const response = await fetch(dataUrl)
  const blob = await response.blob()
  const file = new File([blob], 'eventtrack-checkin-qr.png', {
    type: 'image/png',
  })

  if (navigator.canShare && !navigator.canShare({ files: [file] })) {
    await navigator.share({ title, text })
    return
  }

  await navigator.share({
    title,
    text,
    files: [file],
  })
}

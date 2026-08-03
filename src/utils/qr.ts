/**
 * QR payload helpers.
 * The QR code stores ONLY a secure registration token — never PII.
 */

const QR_PREFIX = 'eventtrack:reg:'

export function buildQrPayload(qrToken: string): string {
  return `${QR_PREFIX}${qrToken}`
}

export function parseQrPayload(raw: string): string | null {
  const value = raw.trim()

  if (value.startsWith(QR_PREFIX)) {
    const token = value.slice(QR_PREFIX.length).trim()
    return token.length > 0 ? token : null
  }

  // Allow raw hex tokens (64 chars from gen_random_bytes(32))
  if (/^[a-f0-9]{64}$/i.test(value)) {
    return value.toLowerCase()
  }

  return null
}

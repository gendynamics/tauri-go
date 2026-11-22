#!/usr/bin/env bash
# Tauri Go - Dev Server with QR Code
# Starts your frontend dev server on the local network and prints a QR code
# for instant iPhone pairing. Like Expo Go, but for Tauri's Rust-powered soul.

set -euo pipefail

# Detect local IP (prefer en0 on macOS)
IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || echo "127.0.0.1")
PORT=${PORT:-1420}
URL="http://${IP}:${PORT}"

echo "🚀 Tauri Go Dev Server"
echo "======================"
echo "Local IP: $IP"
echo "URL: $URL"
echo ""

# Generate QR code (requires qrencode: brew install qrencode)
if command -v qrencode >/dev/null 2>&1; then
  echo "Scan this QR with Tauri Go on your iPhone:"
  qrencode -t ANSIUTF8 "$URL"
  echo ""
  qrencode -o /tmp/tauri-go-qr.png "$URL"
  echo "QR image also saved to /tmp/tauri-go-qr.png"
else
  echo "Install qrencode for visual QR: brew install qrencode"
  echo "Or copy the URL above into Tauri Go."
fi

echo ""
echo "Starting frontend dev server bound to 0.0.0.0:$PORT ..."
echo "Make sure your vite.config.ts / equivalent honors host 0.0.0.0 or TAURI_DEV_HOST."
echo ""

# Assume npm/yarn/pnpm. Adjust if your package manager differs.
# This should match your existing "dev" script but forced to host.
export TAURI_DEV_HOST="$IP"
exec npm run dev -- --host 0.0.0.0 --port "$PORT" || \
  yarn dev --host 0.0.0.0 --port "$PORT" || \
  pnpm run dev -- --host 0.0.0.0 --port "$PORT"

# Tauri Go — Expo-style Live Development Shell for Tauri 2

**From the desk of the Chief Founder, genstrointelligence LLC**

This is the missing bridge. Just as Tesla dreamed of energy that flows freely through the air, and Elon builds the infrastructure that turns vision into planetary scale, Tauri Go lets your Rust-powered Tauri commands live on the iPhone while your frontend iterates at the speed of thought.

## Phase 1 — Private shell for Quincidia (proof of concept)

- Tauri 2 iOS app that bundles Quincidia’s current Rust code and Tauri commands
- Launch screen: scan a QR code or enter the dev server address on local Wi-Fi
- Load the frontend live from the dev server with hot reload
- Remember the last server; auto-reconnect; fall back to the bundled frontend if unreachable
- Shake gesture or hidden button to reload or switch server
- Mac-side script: start the dev server on the LAN and print a QR code
- Keep Quincidia’s design and Rust logic exactly as they are
- Cloud build (GitHub Actions macOS runner) → upload to TestFlight

## Integration Steps

1. Copy `shell-frontend/index.html` into your frontend assets as `shell.html`.
2. Add the shake injection script via `.initialization_script()` so the real frontend never changes.
3. Make the dev script executable and run `./scripts/tauri-go-dev.sh`.
4. Configure Vite to honor `TAURI_DEV_HOST` / `--host 0.0.0.0`.
5. Set Apple signing secrets and run the workflow.

Your existing `src-tauri` Rust code is reused verbatim.

## Vision

Phase 2 will ship a public Tauri Go that bundles every official plugin. Phase 3 adds the CLI and custom cloud-built clients. Phase 4 open-sources the core.

We are not building another wrapper. We are removing the friction between the mind that designs and the device that runs.

— CF, genstrointelligence LLC

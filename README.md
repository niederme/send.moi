# send.moi

Archived repository.

The active SendMoi marketing/docs site now lives in `sendmoi/docs`.

Do not make new changes or deploy from this repository.

This repo is kept only as historical context for the retired standalone `send.moi` site.

## Former routes

- `/` marketing landing page
- `/privacy/` privacy policy
- `/terms/` terms of service
- `/accessibility/` accessibility statement

## Support contact

- Footer and policy pages use `help@send.moi`

## Historical UI notes

- The homepage now puts the everyday usage flow front and center:
  - the topper stays close to the legacy structure: brand, headline, subheadline, store badges, and video demo
  - the section below is now a single full-width `How it works` module with a 3-step save-for-later flow
  - a second reassurance section now answers likely first-visit questions about privacy, account usage, requirements, and sending behavior
- On narrow mobile viewports, the `Coming soon` App Store annotation is constrained to the card edge to avoid horizontal side-scroll.
- The landing-page hero now collapses to a stacked layout earlier at mid-width breakpoints so the demo video can stay centered and effectively full-width.
- Marketing icon assets now ship as theme variants:
  - `assets/images/sendmoi/app-icon-light.png`
  - `assets/images/sendmoi/app-icon-dark.png`
  - `assets/images/sendmoi/app-icon.png` remains as a light fallback export
- Brand accent colors across the site are synced to the app icon source palette from `SendMoi/AppIcon.icon` (blue/violet gradient family).
- Homepage headline and policy/accessibility page title text gradients now use:
  - `#2B7FFF` at `0%`
  - `#8722FB` at `37%`
  - `#9810FA` at `47%`
  - `#8722FB` at `58%`
  - `#6C3DFC` at `67%`
  - `#2B7FFF` at `89%`
- Feature visuals for `Your Gmail, kept private`, `Offline queue`, and `Recent recipients` are now custom in-repo illustrations with matching light/dark PNG variants:
  - `assets/images/sendmoi/features/02-{Light,Dark}.png`
  - `assets/images/sendmoi/features/04-{Light,Dark}.png`
  - `assets/images/sendmoi/features/05-{Light,Dark}.png`

## Local dev

Local development in this repo is no longer the source of truth. Use the `sendmoi` repo for active work.

Run this from the repo root:

```bash
make
```

This starts a static server on all interfaces (`0.0.0.0`) and prints:
- `http://<this-mac>.local:8000` for this Mac (derived from macOS `LocalHostName`, for example `http://niederstudio.local:8000`)
- a LAN URL like `http://192.168.x.x:8000` for other devices on the same network

It also opens the `.local` URL on this Mac.

If port `8000` is already in use, `make dev` automatically picks the next available port and prints the exact URLs.

Use a different port if needed:

```bash
make dev PORT=8080
```

`make dev-lan` is available as an alias of `make dev`.

## Live reload

For auto-refresh in the browser on save:

```bash
make dev-live
```

This uses BrowserSync to serve the repo and reload when HTML/CSS/JS files change.

Requirements:
- Node.js with `npx` available (recommended: Node 20 via `nvm use 20`)
- Runtime support for `node:path`

## Local-only mode

Run:

```bash
make dev-local
```

That binds to localhost only.

## Deploy

Deployments from this repo are intentionally disabled. Deploy from `sendmoi/docs` instead.

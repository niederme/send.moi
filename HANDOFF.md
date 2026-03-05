# SendMoi Marketing Handoff

Last updated: March 5, 2026

## Branch

- `main`

## Current focus

- Standalone `send.moi` marketing site migration from `nieder.me/sendmoi`
- Consistent local dev workflow (`make`, `make dev-live`, `.local` + LAN URLs)
- Footer and support-contact consistency across all pages

## What changed

- Imported standalone site pages into this repo:
  - `index.html`
  - `privacy/index.html`
  - `terms/index.html`
  - `accessibility/index.html`
- Added local development `Makefile` targets:
  - `make` / `make dev`
  - `make dev-lan`
  - `make dev-local`
  - `make dev-live`
- Copied required assets into this repo:
  - `assets/fonts/soehne-{leicht,buch,halbfett}.woff2`
  - `assets/images/sendmoi/*`
  - `assets/videos/sendmoi/*`
- Updated domain and path references for standalone hosting:
  - canonical/OG/twitter URLs now use `https://send.moi`
  - legal links now route to `/privacy/`, `/terms/`, `/accessibility/`
- Updated app icon references with cache busting:
  - `app-icon.png?v=20260305-2`
- Updated support email references:
  - `help@mail.moi`
- Footer refinements:
  - child-page footer moved outside the content card
  - child-page footer spacing and link styling aligned with homepage
  - child pages now omit the top divider line above footer

## Open items

- Replace temporary App Store `href="#"` targets with live store URLs at launch.
- Run final visual QA on desktop + iPhone Safari for footer and spacing consistency.

## Local run

- Network + `.local` URL:
  - `make`
- Live reload:
  - `make dev-live`
- Localhost only:
  - `make dev-local`

## Resume checklist

1. `git fetch --all`
2. `git checkout main`
3. `git pull --ff-only`
4. `make`
5. Validate `/`, `/privacy/`, `/terms/`, `/accessibility/` in browser

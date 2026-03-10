# SendMoi Marketing Handoff

Last updated: March 10, 2026

## Branch

- `codex/update-text-gradients`

## Current focus

- Refreshing visual branding details on live pages:
  - updated app icon art
  - updated heading gradient stops
- Keeping deployment/docs handoff aligned with active branch state

## What changed

- Reworked the landing-page hero messaging to match the App Store pairing:
  - title treatment remains `SendMoi`
  - hero headline now reads `Your inbox, in two taps.`
  - supporting gray copy now carries the Gmail mention
- Applied typography wrapping defaults across the site:
  - `text-wrap: balance` on headings
  - `text-wrap: pretty` on longer body copy
- Added repository GitHub issue-handling instructions in `AGENTS.md`:
  - `BUG:` or `ISSUE:` messages should create GitHub issues directly
  - infer issue type/labels unless explicitly provided
  - ask one short follow-up only when required details are missing
  - include screenshots/videos in the issue body via URL or uploaded repo asset
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
  - `app-icon.png?v=20260305-5`
- Updated support email references:
  - `help@mail.moi`
- Footer refinements:
  - child-page footer moved outside the content card
  - child-page footer spacing and link styling aligned with homepage
  - child pages now omit the top divider line above footer
  - child-page hero icon/title stay side-by-side on mobile and preserve `SendMoi` casing in the eyebrow label
- Mobile overflow fix:
  - constrained `Coming soon` annotation offsets on the landing page so narrow screens do not side-scroll
- Responsive hero polish:
  - retained the 2-column hero at larger tablet widths only
  - added an intermediate stacked breakpoint so the product demo centers and expands to full width sooner
  - kept App Store badges centered in stacked states and left-aligned in the wider 2-column state
- Refreshed icon cache-busting references across all pages:
  - `app-icon.png?v=20260307-1`
- Refreshed app icon art in `assets/images/sendmoi/app-icon.png` and bumped references:
  - `app-icon.png?v=20260310-1`
- Updated heading gradients on all page hero titles to:
  - `#2B7FFF` at `0%`
  - `#8722FB` at `37%`
  - `#9810FA` at `47%`
  - `#8722FB` at `58%`
  - `#6C3DFC` at `67%`
  - `#2B7FFF` at `89%`
- Created GitHub issue for this work:
  - `#5` Update page icon art and heading gradient
- Added deploy scripts (based on `nieder.me` deploy flow, production-only):
  - `scripts/deploy.sh`
  - `scripts/set-site-url.sh`
  - defaults: `suckahs.org` / `suckahs` / `/home/suckahs/public_html/sendmoi`
  - supports `DRY_RUN=1` preview mode
  - auto-updates canonical/social URLs and bumps icon cache-busting for `app-icon-light.png` and `app-icon-dark.png`
- Video asset cleanup:
  - replaced `assets/videos/sendmoi/sendmoi-demo-hero.mp4` with a newly recaptured hero recording
  - removed unused `assets/videos/sendmoi/sendmoi-demo-short.mp4`
- Replaced placeholder artwork for three feature cards with custom light/dark illustrations:
  - `Your Gmail, kept private` -> `assets/images/sendmoi/features/02-{Light,Dark}.png`
  - `Offline queue` -> `assets/images/sendmoi/features/04-{Light,Dark}.png`
  - `Recent recipients` -> `assets/images/sendmoi/features/05-{Light,Dark}.png`

## Open items

- Replace temporary App Store `href="#"` targets with live store URLs at launch.
- Run final visual QA on desktop + iPhone Safari for icon rendering and heading-gradient consistency.
- Run `DRY_RUN=1 ./scripts/deploy.sh`, then production deploy once SSH access is available from the active machine.

## Local run

- Network + `.local` URL:
  - `make`
- Live reload:
  - `make dev-live`
- Localhost only:
  - `make dev-local`
- Deploy:
  - `./scripts/deploy.sh`
- Deploy preview (no remote writes):
  - `DRY_RUN=1 ./scripts/deploy.sh`

## Resume checklist

1. `git fetch --all`
2. `git checkout codex/update-text-gradients`
3. `git pull --ff-only`
4. `make`
5. Validate `/`, `/privacy/`, `/terms/`, `/accessibility/` in browser
6. Run `DRY_RUN=1 ./scripts/deploy.sh`
7. Run `./scripts/deploy.sh`

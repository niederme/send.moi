# SendMoi Marketing Handoff

Last updated: March 7, 2026

## Branch

- `codex/site-page-edits`

## Current focus

- Standalone `send.moi` marketing site migration from `nieder.me/sendmoi`
- Consistent local dev workflow (`make`, `make dev-live`, `.local` + LAN URLs)
- Footer and support-contact consistency across all pages
- Production deploy workflow for standalone `send.moi`
- Final responsive polish before deploy / machine handoff

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
- Added deploy scripts (based on `nieder.me` deploy flow, production-only):
  - `scripts/deploy.sh`
  - `scripts/set-site-url.sh`
  - defaults: `suckahs.org` / `suckahs` / `/home/suckahs/public_html/sendmoi`
  - supports `DRY_RUN=1` preview mode
  - auto-updates canonical/social URLs and bumps `app-icon.png?v=YYYYMMDD-N`

## Open items

- Replace temporary App Store `href="#"` targets with live store URLs at launch.
- Run final visual QA on desktop + iPhone Safari for hero transition and footer spacing consistency.
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
2. `git checkout codex/site-page-edits`
3. `git pull --ff-only`
4. `make`
5. Validate `/`, `/privacy/`, `/terms/`, `/accessibility/` in browser
6. Run `DRY_RUN=1 ./scripts/deploy.sh`
7. Run `./scripts/deploy.sh`

# SendMoi Marketing Handoff

Last updated: March 12, 2026

## Branch

- `codex/issue-12-staged-deploy`

## Current focus

- Clarify homepage value messaging around link delivery as rich email cards
- Standalone `send.moi` marketing site migration from `nieder.me/sendmoi`
- Consistent local dev workflow (`make`, `make dev-live`, `.local` + LAN URLs)
- Footer and support-contact consistency across all pages
- Production deploy workflow for standalone `send.moi`
- Keep deploy-specific cache busting out of tracked files so deploys do not dirty the branch
- Final responsive polish before deploy / machine handoff

## What changed

- Reworked deploy staging so deploy-specific rewrites do not dirty tracked files:
  - `scripts/deploy.sh` now copies the site into a temporary staging directory before any rewrites
  - canonical/social URL rewrites now target the staged pages instead of the working tree
  - app-icon cache-busting is now hash-based per staged asset instead of date-sequence based in tracked HTML
  - rsync now deploys the staged site paths, keeping local checked-in files unchanged after deploy
- Refined homepage value copy to emphasize rich email-card delivery:
  - updated hero supporting line to `SendMoi sends links to Gmail as rich email cards, so they're easy to find and act on later.`
  - synced the same line across `description`, `og:description`, and `twitter:description` in `index.html`
- Bumped app icon cache-busting query strings to `v=20260310-1` across homepage and policy pages:
  - updated favicon / apple-touch-icon and in-page icon references in `/`, `/privacy/`, `/terms/`, and `/accessibility/`
  - updated homepage social preview image references (`og:image`, `og:image:secure_url`, `twitter:image`)
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
- Updated marketing app icon assets to separate light/dark variants sourced from iOS exports:
  - added `assets/images/sendmoi/app-icon-light.png` (default/light)
  - added `assets/images/sendmoi/app-icon-dark.png` (dark)
  - refreshed `assets/images/sendmoi/app-icon.png` as the light fallback export
  - homepage and policy/accessibility/terms hero icons now switch by theme (system preference + manual toggle)
  - favicon tags now include a dark-mode icon variant (`media="(prefers-color-scheme: dark)"`)
  - social preview metadata uses `app-icon-light.png`
- Resynced the light/dark icon sources again from `/Users/niederme/~Repos/sendmoi/marketing/app-icons` and bumped live references to `v=20260309-2`
- Adjusted the marketing color palette to match `/Users/niederme/~Repos/sendmoi/SendMoi/AppIcon.icon`:
  - remapped primary blue/violet accent tokens to icon-aligned values
  - updated gradient stops and accent rgba overlays on homepage + policy pages
  - current text-gradient stops for homepage headline + policy/accessibility titles:
    - `#2B7FFF` at `0%`
    - `#8722FB` at `37%`
    - `#9810FA` at `47%`
    - `#8722FB` at `58%`
    - `#6C3DFC` at `67%`
    - `#2B7FFF` at `89%`
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
- Run final visual QA on desktop + iPhone Safari for hero transition and footer spacing consistency.
- Verify the staged deploy output with `DRY_RUN=1 ./scripts/deploy.sh`, then production deploy once SSH access is available from the active machine.

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
2. `git checkout codex/issue-12-staged-deploy`
3. `git pull --ff-only`
4. `make`
5. Validate `/`, `/privacy/`, `/terms/`, `/accessibility/` in browser
6. Run `DRY_RUN=1 ./scripts/deploy.sh`
7. Run `./scripts/deploy.sh`

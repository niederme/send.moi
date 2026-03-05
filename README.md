# send.moi

Marketing site for SendMoi.

## Routes

- `/` marketing landing page
- `/privacy/` privacy policy
- `/terms/` terms of service
- `/accessibility/` accessibility statement

## Support contact

- Footer and policy pages use `help@mail.moi`

## Local dev

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

Run:

```bash
./scripts/deploy.sh
```

Preview only (no remote changes):

```bash
DRY_RUN=1 ./scripts/deploy.sh
```

Defaults mirror the `nieder.me` deploy host/user and deploy to:
- `DEPLOY_HOST=suckahs.org`
- `DEPLOY_USER=suckahs`
- `DEPLOY_PATH=/home/suckahs/public_html/sendmoi`
- `DEPLOY_PORT=22`
- `SITE_URL=https://send.moi`

Override as needed, for example:

```bash
DEPLOY_PATH=/home/suckahs/public_html/custom-sendmoi ./scripts/deploy.sh
```

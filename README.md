# send.moi

Marketing site for SendMoi.

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

# SendMoi Marketing Handoff

Last updated: April 13, 2026

## Status

- This repository is archived/decommissioned.
- The active SendMoi marketing/docs source now lives in `sendmoi/docs`.
- Do not make new changes or deploy from this repository.

## Migration note

- Treat this repo as historical reference only for the retired standalone `send.moi` site.
- Active implementation, docs changes, and deploy work should happen from the `sendmoi` repo.

## Operational note

- `scripts/deploy.sh` is intentionally blocked in this repo.
- If an emergency historical deploy is ever needed, it must be an explicit one-off override and should be followed by reconciling the real source in `sendmoi/docs`.

## Resume checklist

1. Work from the `sendmoi` repository instead of this one.
2. Make active site/docs changes under `sendmoi/docs`.
3. Run preview and deploy commands from `sendmoi`, not from `send.moi`.

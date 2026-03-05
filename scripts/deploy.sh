#!/usr/bin/env bash
set -euo pipefail

# Deploy static site files over SSH + rsync.
# Defaults can be overridden via env vars:
#   DEPLOY_HOST
#   DEPLOY_USER
#   DEPLOY_PATH
# Optional env vars:
#   DEPLOY_PORT   e.g. 22 (default: 22)
#   DRY_RUN       set to 1 for preview mode
#   SITE_URL      defaults to https://send.moi

DEPLOY_HOST="${DEPLOY_HOST:-suckahs.org}"
DEPLOY_USER="${DEPLOY_USER:-suckahs}"
DEPLOY_PATH="${DEPLOY_PATH:-/home/suckahs/public_html/sendmoi}"

DEPLOY_PORT="${DEPLOY_PORT:-22}"
DRY_RUN="${DRY_RUN:-0}"
SITE_URL="${SITE_URL:-https://send.moi}"

RSYNC_ARGS=(
  -avz
  --delete
  --exclude .git/
  --exclude .DS_Store
)

if [[ "$DRY_RUN" == "1" ]]; then
  RSYNC_ARGS+=(--dry-run)
fi

./scripts/set-site-url.sh "$SITE_URL"

# Auto-bump icon cache-bust query string in all pages:
# app-icon.png?v=YYYYMMDD-N
today="$(date +%Y%m%d)"
existing_version="$(grep -Eo 'app-icon\.png\?v=[0-9]{8}-[0-9]+' index.html | head -n1 | sed -E 's#.*\?v=##' || true)"
next_seq=1

if [[ "$existing_version" =~ ^([0-9]{8})-([0-9]+)$ ]]; then
  existing_date="${BASH_REMATCH[1]}"
  existing_seq="${BASH_REMATCH[2]}"
  if [[ "$existing_date" == "$today" ]]; then
    next_seq=$((10#$existing_seq + 1))
  fi
fi

new_version="${today}-${next_seq}"

perl -0pi -e "s#app-icon\\.png(?:\\?v=[0-9]{8}-[0-9]+)?#app-icon.png?v=${new_version}#g" \
  index.html privacy/index.html terms/index.html accessibility/index.html

image_url="${SITE_URL%/}/assets/images/sendmoi/app-icon.png?v=${new_version}"
perl -0pi -e "s#<meta property=\"og:image\" content=\"[^\"]*\" />#<meta property=\"og:image\" content=\"${image_url}\" />#g" index.html
perl -0pi -e "s#<meta property=\"og:image:secure_url\" content=\"[^\"]*\" />#<meta property=\"og:image:secure_url\" content=\"${image_url}\" />#g" index.html
perl -0pi -e "s#<meta name=\"twitter:image\" content=\"[^\"]*\" />#<meta name=\"twitter:image\" content=\"${image_url}\" />#g" index.html

echo "Using app icon cache-bust version: ${new_version}"

REMOTE="${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH%/}/"

# Ensure remote target exists.
ssh -p "$DEPLOY_PORT" "${DEPLOY_USER}@${DEPLOY_HOST}" "mkdir -p '${DEPLOY_PATH%/}'"

# Sync site pages and assets.
rsync "${RSYNC_ARGS[@]}" -e "ssh -p $DEPLOY_PORT" \
  index.html privacy terms accessibility assets \
  "$REMOTE"

echo "Deploy complete -> $REMOTE"

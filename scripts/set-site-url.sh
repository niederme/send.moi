#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <site-url>" >&2
  exit 1
fi

site_url="${1%/}"

index_url="${site_url}/"
privacy_url="${site_url}/privacy/"
terms_url="${site_url}/terms/"
accessibility_url="${site_url}/accessibility/"

perl -0pi -e "s#<link rel=\"canonical\" href=\"[^\"]*\" />#<link rel=\"canonical\" href=\"${index_url}\" />#g" index.html
perl -0pi -e "s#<meta property=\"og:url\" content=\"[^\"]*\" />#<meta property=\"og:url\" content=\"${index_url}\" />#g" index.html
perl -0pi -e "s#<meta name=\"twitter:url\" content=\"[^\"]*\" />#<meta name=\"twitter:url\" content=\"${index_url}\" />#g" index.html

perl -0pi -e "s#<link rel=\"canonical\" href=\"[^\"]*\" />#<link rel=\"canonical\" href=\"${privacy_url}\" />#g" privacy/index.html
perl -0pi -e "s#<link rel=\"canonical\" href=\"[^\"]*\" />#<link rel=\"canonical\" href=\"${terms_url}\" />#g" terms/index.html
perl -0pi -e "s#<link rel=\"canonical\" href=\"[^\"]*\" />#<link rel=\"canonical\" href=\"${accessibility_url}\" />#g" accessibility/index.html

echo "Updated canonical/social URLs for ${site_url}"

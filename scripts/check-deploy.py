#!/usr/bin/env python3
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
DEPLOY_SCRIPT = ROOT / "scripts" / "deploy.sh"

contents = DEPLOY_SCRIPT.read_text()

required_tokens = [
    'DEPLOY_HOST="${DEPLOY_HOST:-ssh.suckahs.org}"',
    'DEPLOY_PATH="${DEPLOY_PATH:-/home2/suckahs/public_html/sendmoi}"',
]

for token in required_tokens:
    if token not in contents:
        print(f"missing expected deploy token: {token}")
        sys.exit(1)

for forbidden in [
    'DEPLOY_HOST="${DEPLOY_HOST:-suckahs.org}"',
    'DEPLOY_PATH="${DEPLOY_PATH:-/home/suckahs/public_html/sendmoi}"',
]:
    if forbidden in contents:
        print(f"stale deploy token still present: {forbidden}")
        sys.exit(1)

print("deploy verifier passed")

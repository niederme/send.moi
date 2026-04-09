#!/usr/bin/env python3
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
WORKFLOW = ROOT / ".github" / "workflows" / "deploy.yml"
DEPLOY_SCRIPT = ROOT / "scripts" / "deploy.sh"
README = ROOT / "README.md"

if not WORKFLOW.exists():
    print(f"missing deploy workflow: {WORKFLOW}")
    sys.exit(1)

workflow_contents = WORKFLOW.read_text()
deploy_contents = DEPLOY_SCRIPT.read_text()
readme_contents = README.read_text()

workflow_tokens = [
    "name: Deploy",
    "push:",
    "branches:",
    "SSH_PRIVATE_KEY",
    "./scripts/deploy.sh",
]

deploy_tokens = [
    'DEPLOY_IDENTITY_FILE="${DEPLOY_IDENTITY_FILE:-}"',
    "-o IdentitiesOnly=yes",
    'elif [[ -f "${HOME}/.ssh/send_moi_deploy" ]]; then',
    'SSH_CMD+=(-i "${HOME}/.ssh/send_moi_deploy")',
]

readme_tokens = [
    "Merging to `main` triggers the GitHub Actions deploy workflow automatically.",
    "`SSH_PRIVATE_KEY`",
]

for token in workflow_tokens:
    if token not in workflow_contents:
        print(f"missing deploy workflow token: {token}")
        sys.exit(1)

if "main" not in workflow_contents:
    print("deploy workflow does not appear to target main")
    sys.exit(1)

for token in deploy_tokens:
    if token not in deploy_contents:
        print(f"missing deploy script token: {token}")
        sys.exit(1)

for token in readme_tokens:
    if token not in readme_contents:
        print(f"missing README deploy token: {token}")
        sys.exit(1)

print("github deploy verifier passed")

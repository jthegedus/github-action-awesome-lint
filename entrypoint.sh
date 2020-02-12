#!/bin/sh

set -euo pipefail

echo "[INFO] Installing awesome-lint@${AWESOME_LINT_VERSION}"
npm install -g awesome-lint@${AWESOME_LINT_VERSION}

echo "[INFO] Executing:"
echo "[INFO] awesome-lint $*"
sh -c "awesome-lint $*"

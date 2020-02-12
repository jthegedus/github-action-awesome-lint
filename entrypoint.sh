#!/bin/sh

set -euo pipefail

echo "installing awesome-lint@${AWESOME_LINT_VERSION}"
npm install -g awesome-lint@${AWESOME_LINT_VERSION}

sh -c "awesome-lint $*"

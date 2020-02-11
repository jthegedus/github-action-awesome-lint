#!/bin/sh

set -euo pipefail

echo "version: +${VERSION}+"
npm install -g awesome-lint@${INPUT_VERSION:-latest}

sh -c "awesome-lint $*"

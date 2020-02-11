#!/bin/sh

set -euo pipefail

npm install -g awesome-lint@${INPUT_VERSION:-master}

sh -c "awesome-lint $*"

#!/bin/bash
set -efuo pipefail

# Get the project dir regardless of pwd or symlinks:
BASEDIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

set -x
cd "$BASEDIR"
exec docker build -t render-zips .

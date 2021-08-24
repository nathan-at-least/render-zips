#!/bin/bash
set -x
set -efuo pipefail

# Get the project dir regardless of pwd or symlinks:
BASEDIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

cd "$BASEDIR"
exec docker build -t render-zips .

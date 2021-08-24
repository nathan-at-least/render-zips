#!/bin/bash
set -x
set -efuo pipefail

DATADIR="$HOME/zips"

function main
{
  [ -d "$DATADIR" ] || mkdir -v "$DATADIR"

  exec docker run \
    --volume "${DATADIR}:/render-zips" \
    render-zips \
    "$@"
}

main "$@"

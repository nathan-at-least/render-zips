#!/bin/bash
set -efuo pipefail

DATADIR="$HOME/zips"

function main
{
  if [ $# -gt 0 ] && [[ "$1" =~ ^(-b|--build)$ ]]
  then
    shift
    SCRIPTDIR="$(dirname "$(readlink -f "$0")")"
    eval "${SCRIPTDIR}/build.sh"
  fi

  [ -d "$DATADIR" ] || mkdir -v "$DATADIR"

  exec docker run \
    --volume "${DATADIR}:/render-zips" \
    render-zips \
    "$@"
}

main "$@"

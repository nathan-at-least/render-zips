#!/bin/bash
set -efuo pipefail

DATADIR="$HOME/render-zips-data"

function main
{
  if [ $# -gt 0 ] && [[ "$1" =~ ^(-b|--build)$ ]]
  then
    shift
    SCRIPTDIR="$(dirname "$(readlink -f "$0")")"
    eval "${SCRIPTDIR}/build.sh"
  fi

  [ -d "$DATADIR" ] || mkdir -vp "$DATADIR/render"

  exec docker run \
    --volume "${DATADIR}:/render-zips" \
    render-zips \
    "$@"
}

main "$@"

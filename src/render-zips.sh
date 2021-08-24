#!/bin/bash
set -efuo pipefail

SRCDIR='/render-zips/src'
RENDERDIR='/render-zips/render'

function show-help
{
  sed 's/^    //' << __EOF
    Usage: $(basename "$0")

    Render the ZIP source into the output directory.
__EOF
}

function main
{
  if [ $# -gt 0 ] && [ "$1" = '--trace' ]
  then
    shift
    set -x
  fi

  usage-error "not yet implemented; args $*"
}

function usage-error
{
  echo -e "Usage error: $*\n"
  show-help
}

main "$@"

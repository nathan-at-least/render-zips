#!/bin/bash
set -efuo pipefail

SRCDIR='/render-zips/src'
RENDERDIR='/render-zips/render'

function show-help
{
  sed 's/^    //' << __EOF
    Usage: $(basename "$0") [ --trace ] <GIT-URL>

    Clone or fetch the <GIT-URL>, then render it. If a local copy or
    rendering already exists, use cached results were possible.

    Options:
      --trace - enable bash xtrace.
__EOF
  exit 1
}

function main
{
  if [ $# -gt 0 ] && [ "$1" = '--trace' ]
  then
    shift
    set -x
  fi

  if [ $# -gt 0 ] && [ "$1" = '--help' ]
  then
    show-help
  fi

  [ $# = 1 ] || usage-error 'Expected single <GIT-URL> argument.'
  GITURL="$1"

  usage-error "not yet implemented; args $*"
}

function usage-error
{
  echo -e "Usage error: $*\n"
  show-help
}

main "$@"

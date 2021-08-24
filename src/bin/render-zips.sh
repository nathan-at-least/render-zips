#!/bin/bash
set -euo pipefail

# Do this explicitly because docker doesn't use login/user shells:
source ~/.bashrc

SELF="$(dirname "$0")"
SRCDIR='/render-zips/src'
RENDERDIR='/render-zips/render'

function show-help
{
  sed 's/^    //' << __EOF
    Usage: $SELF [ --trace ] <GIT-URL>

    Clone or pull the <GIT-URL>, then render it. If a local copy or
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

  echo "=== $SELF $GITURL ==="
  update-git-src "$GITURL"
  render
}

function update-git-src
{
  local giturl="$1"
  if [ -d "${SRCDIR}/.git" ]
  then
    ( cd "$SRCDIR" ; log-run git pull --ff-only "$giturl" )
  else
    log-run git clone "$giturl" "$SRCDIR"
  fi
}

function render
{
  render-rst-zips
  render-md-zips
  render-protocol-spec
}

function render-rst-zips
{
  for rst in "$SRCDIR"/*.rst
  do
    rname="$(basename "$rst" | sed 's|\.rst$|.html|')"
    log-run rst2html5 -v --title='FIXME-TITLE' "$rst" \> "$RENDERDIR/$rname"
  done
}

function render-md-zips
{
  fail "not implemented $FUNC_NAME"
}

function render-protocol-spec
{
  fail "not implemented $FUNC_NAME"
}

function usage-error
{
  echo -e "Usage error: $*\n"
  show-help
}

function fail
{
  echo -e "FAIL: $*\n"
  exit 2
}

function log-run
{
  echo "Running: $*"
  eval "$@"
}

main "$@"

#!/usr/bin/env bash

set -euo pipefail

EXECUTABLE="${BASH_SOURCE:-$0}"
ROOT="$(dirname "$(readlink -f "$EXECUTABLE")")"

function usage() {
  cat <<EOF
  Usage: $EXECUTABLE [-h | --help]
  
  Options:
     -h, --help        Show this page
EOF
}

function main() {
  POSITIONAL_ARGS=()
  while [[ $# -gt 0 ]]; do
    case "$1" in
    -h | --help)
      usage
      exit
      ;;
    --*)
      error "Unrecognised option: $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1")
      shift
      ;;
    esac
  done
  set -- "${POSITIONAL_ARGS[@]}"
  unset POSITIONAL_ARGS

  symlink-files
}

function symlink-files() {
  # Install home dotfiles
  for f in "$ROOT"/home/.*; do
    ln -siv "$f" ~/ || true
  done

  # Install config files
  mkdir -p ~/.config/
  for f in "$ROOT"/config/*; do
    ln -siv "$f" ~/.config/ || true
  done

  # Install local bin
  mkdir -p ~/.local/bin
  for f in "$ROOT"/bin/*; do
    ln -siv "$f" ~/.local/bin/ || true
  done
}

main "$@"

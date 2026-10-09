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

function setup() {
  local target="$1"
  shift

  local dir
  mkdir -p "$target"
  for f in "$@"; do
    dir="$(dirname "$f")"
    if [[ -x "$dir"/setup ]]; then
      (cd "$dir" && "$dir"/setup)
      echo "Executed '$dir/setup'."
    fi

    ln -siv "$f" "$target" || true
  done
}

function symlink-files() {
  # Home dotfiles
  setup ~/ "$ROOT"/home/.*

  # .config
  setup ~/.config "$ROOT"/config/*

  # Scripts
  setup ~/.local/bin/ "$ROOT"/bin/* 
}

main "$@"

#!/usr/bin/env bash

set -e

FILEPATH="$(readlink -f "${BASH_SOURCE:-$0}")"
SRC="$(dirname "$FILEPATH")"

function help() {
  echo "Usage: ./install.sh [-h | --help] [-l | --link-only] [-s | --setup-only]"
  echo ""
  echo "Explanation of the options:"
  echo ""
  echo "   --help           Show this page"
  echo "   --link-only      Link the config files but do not run their setup"
  echo "                    scripts"
  echo "   --setup-only     Run the setup scripts without symlinking any files"
}

function run-setup() {
  echo "Running config scripts..."
  echo "---"
  echo

	for f in "$SRC"/config/*; do
		if [[ -f "$f/.install/install.sh" ]]; then
      BASE=$(basename "$f")
			echo "Running '$BASE' setup scriptlet..."

			pushd "$f/.install" >/dev/null
			./install.sh
			popd >/dev/null

			echo "$BASE: Done."
		fi
	done

  echo
  echo "---"
  echo "Finished running config scripts."
}

function symlink-files() {
  # Install home dotfiles
  for f in "$SRC"/home/{*,.*}; do
    ln -siv "$SRC/home/$f" ~/
  done

  # Install config files
  mkdir -p ~/.config/
  for f in "$SRC"/config/{*,.*}; do
    ln -siv "$f" ~/.config/
  done

  # Install local bin
  mkdir -p ~/.local/bin
  for f in "$SRC"/bin/{*,.*}; do
    ln -siv "$f" ~/.local/bin/
  done
}

SHOULD_SETUP=1
SHOULD_LINK=1
while true; do
  case "$1" in
    -h | --help)
      help
      exit
      ;;
    -s | --setup-only)
      shift
      SHOULD_LINK=0
      ;;
    -l | --link-only)
      shift
      SHOULD_SETUP=0
      ;;
    *)
      break
      ;;
  esac
done

if [[ $SHOULD_SETUP == 0 ]] && [[ $SHOULD_LINK == 0 ]]; then
  echo "The options --link-only and --setup-only are mutually exclusive."
fi

[[ $SHOULD_LINK == 1 ]] && symlink-files
[[ $SHOULD_SETUP == 1 ]] && run-setup

#!/usr/bin/env bash

# Figure out how to check if itch is installed
if [ ! -f ~/.local/bin/itch-setup ]; then
  pushd `mktemp -d` >/dev/null
  OUTFILE="itch-setup-linux-amd64.zip"
  wget "https://broth.itch.ovh/itch-setup/linux-amd64/1.26.0/archive/default" -O "$OUTFILE" -q
  mkdir -p ~/.local/bin/
  unzip "$OUTFILE" -d ~/.local/bin/
  ~/.local/bin/itch-setup --silent
  popd >/dev/null
else
  echo "Found traces of Itch installer. Executing..."
  ~/.local/bin/itch-setup --silent
fi

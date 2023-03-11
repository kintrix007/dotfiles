#!/bin/bash

(sudo dnf install -y vlc-bittorrent \\
  sudo dnf install -y nodejs) &

# Install Itch.io desktop client
pushd `mktemp -d`
OUTFILE="itch-setup-linux-amd64.zip"
wget "https://broth.itch.ovh/itch-setup/linux-amd64/1.26.0/archive/default" -O "$OUTFILE" -q
unzip "$OUTFILE" -d ~/.local/bin/
~/.local/bin/itch-setup --silent
popd

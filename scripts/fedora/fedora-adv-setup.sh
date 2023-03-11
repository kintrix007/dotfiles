#!/bin/bash

(sudo dnf install -y vlc-bittorrent \\
  sudo dnf install -y nodejs) &

# Install ghcup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Itch.io desktop client
pushd `mktemp -d`
OUTFILE="itch-setup-linux-amd64.zip"
wget "https://broth.itch.ovh/itch-setup/linux-amd64/1.26.0/archive/default" -O "$OUTFILE" -q
unzip "$OUTFILE" -d ~/.local/bin/
~/.local/bin/itch-setup --silent
popd

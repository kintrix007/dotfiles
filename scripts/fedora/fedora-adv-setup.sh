#!/bin/bash

sudo dnf install -y nodejs python3-pip

(sudo dnf install -y vlc-bittorrent && \
  sudo dnf install -y ) &

npm install -g npm

../installers/ghcup.sh
../installers/rustup.sh
../installers/purescript.sh
../installers/itch-desktop.sh

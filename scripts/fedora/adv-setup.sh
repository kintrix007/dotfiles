#!/bin/bash

sudo dnf install -y nodejs python3-pip

(sudo dnf install -y vlc-bittorrent && \
  sudo dnf install -y g++
  sudo dnf install -y steam) &

sudo npm install -g npm

../installers/ghcup.sh
../installers/rustup.sh
../installers/v.sh
../installers/vs-codium-fedora.sh
../installers/itch-desktop.sh

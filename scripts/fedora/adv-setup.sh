#!/bin/bash

sudo dnf install -y nodejs python3-pip

(sudo dnf remove -y firefox
  sudo dnf install -y vlc-bittorrent
  sudo dnf install -y g++
  sudo dnf install -y steam) &

flatpak install --noninteractive org.mozilla.firefox &
flatpak install --noninteractive com.heroicgameslauncher.hgl &
flatpak install --noninteractive org.libreoffice.LibreOffice &
flatpak install --noninteractive org.onlyoffice.desktopeditors &
flatpak install --noninteractive com.discordapp.Discord &

sudo npm install -g npm

../installers/ghcup.sh
../installers/rustup.sh
../installers/v.sh
../installers/vs-codium-fedora.sh
../installers/itch-desktop.sh

for job in `jobs -p`; do
  wait $job
done

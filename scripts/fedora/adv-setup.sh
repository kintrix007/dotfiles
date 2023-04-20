#!/bin/bash

sudo dnf install -y nodejs python3-pip

(sudo dnf remove -y firefox
  sudo dnf install -y vlc-bittorrent transmission-gtk
  sudo dnf install -y g++
  sudo dnf install -y steam) &

flatpak install --noninteractive flathub org.mozilla.firefox &
flatpak install --noninteractive flathub com.heroicgameslauncher.hgl &
flatpak install --noninteractive flathub org.libreoffice.LibreOffice &
flatpak install --noninteractive flathub org.onlyoffice.desktopeditors &
flatpak install --noninteractive flathub com.discordapp.Discord &
flatpak install --noninteractive flathub org.gimp.GIMP &

sudo npm install -g npm

../installers/ghcup.sh
../installers/rustup.sh
../installers/v.sh
../installers/vs-codium-fedora.sh
../installers/itch-desktop.sh
../installers/nerd-fonts.sh

for job in `jobs -p`; do
  wait $job
done

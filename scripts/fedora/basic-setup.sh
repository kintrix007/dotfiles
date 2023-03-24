#!/bin/bash

sudo dnf upgrade -y

# Enable free rmpfusion repo
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Enable non-free rpmfusion repo
sudo dnf install -y \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

(flatpak update --noninteractive
  flatpak install com.mattjakeman.ExtensionManager --noninteractive) &

# VLC for the drivers
(sudo dnf install -y git gh vim htop neofetch ffmpeg zip unzip xz curl wget prename
  sudo dnf install -y gparted vlc mpv
  sudo dnf install -y papirus-icon-theme breeze-cursor-theme gnome-tweaks
  sudo dnf install -y mozilla-fira-mono-fonts mozilla-fira-sans-fonts fira-code-fonts
  sudo dnf install -y nautilus-gsconnect
  sudo dnf remove -y gnome-extensions-app) &

../installers/nix.sh

for job in `jobs -p`; do
  wait $job
done

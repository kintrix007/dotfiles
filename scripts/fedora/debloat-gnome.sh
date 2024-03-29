#!/bin/bash

echo
echo "  Removing bloat packages..."
echo

sudo dnf remove -y gnome-contacts gnome-weather gnome-clocks gnome-maps gnome-photos totem libreoffice-* gnome-boxes gnome-tour cheese mediawriter yelp gnome-calendar rhythmbox

echo
echo "  Removing fedora flathub filter..."
echo

sudo flatpak remote-modify flathub --no-filter

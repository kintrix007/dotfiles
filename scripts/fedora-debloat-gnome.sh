#!/bin/bash

echo "To be implemented..."
exit 1

echo "Removing bloat packages..."
echo

sudo dnf remove gnome-contacts gnome-weather gnome-clocks gnome-maps gnome-photos totem libreoffice-* gnome-boxes gnome-tour cheese mediawriter yelp gnome-calendar -y

echo
echo "Finished"

#!/bin/bash

if [ ! -d ~/.local/share/fonts/nerd-fonts ]; then
  mkdir -p ~/.local/share/fonts/
  pushd >/dev/null ~/.local/share/fonts
  git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git nerd-fonts
  popd >/dev/null
else
  pushd >/dev/null ~/.local/share/fonts/nerd-fonts
  git pull
  popd >/dev/null
fi

#!/bin/bash

if [ ! -d ~/bin/nerd-fonts ]; then
  mkdir -p ~/bin/
  pushd >/dev/null ~/bin/
  git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git nerd-fonts
  popd >/dev/null
else
  pushd >/dev/null ~/bin/nerd-fonts
  git pull
  popd >/dev/null
fi

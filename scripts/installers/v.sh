#!/bin/bash

if ! which v >/dev/null 2>&1; then
  mkdir -p ~/bin/
  pushd ~/bin/ >/dev/null
  git clone https://github.com/vlang/v vlang
  cd vlang
  make
  sudo ./v symlink
  popd >/dev/null
else
  echo "Nothing to do. V already installed."
fi

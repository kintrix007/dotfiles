#!/bin/bash

if ! which ghcup >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
else
  echo "Nothing to do. GHCup already installed."
fi

#!/bin/bash

if ! which rustup >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Nothing to do. Rustup already installed."
fi

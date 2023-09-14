#!/usr/bin/env bash

if [ ! -d /nix ]; then
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    # ? Or alternatively, the following.
    # ? It is for multi-user installation with no SELinux.
    # sh <(curl -L https://nixos.org/nix/install) --daemon
else
    echo "Nothing to do. Nix already installed."
fi

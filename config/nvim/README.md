# kintrix's neovim config

## Installation

1. Make sure that these configs are located under `~/.config/nvim/`.

2. Make sure that all the relevant plugins are installed through some means.
   Currently expecting the plugins to be managed by Nix.

3. Make sure that the following executables are located on the `PATH` for
   communicating with the system clipboard:
    - `wl-copy` and `wl-paste` for Wayland
    - `xclip` or `xsel` for X11

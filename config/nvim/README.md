# kintrix's neovim config

### Installation

1.  Make sure that these configs are located under `~/.config/nvim/`.

2.  These configs use packer for plugin management. \
    To install packer, run the following command:
    ```bash
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

3.  Open Neovim and install the plugins by executing `:PackerSync`.
    You may need to explicitly source `lua/kintrix/packer.lua` before
    doing that. Just navigate to that file and do `:so`.

4.  It uses Mason for managing language servers.
    Some servers specified in `after/plugin/lspzero.lua` should
    automatically get downloaded upon reopening Neovim. Make sure not
    to close it before they are properly installed.

5.  The Haskell Language Server seems to be acting up if it is set
    to be installed automatically, so just install is by running
    `:MasonInstall haskell-language-server`.


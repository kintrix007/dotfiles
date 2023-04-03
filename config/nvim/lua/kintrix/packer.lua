-- This file can be loaded by calling `lua require('packer')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

-- Brings use 'formally' into scope.
-- Packer would still inject it as a global without it,
-- but this one is cleaner imo.
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- THEMES
    use('sainnhe/everforest', {as = 'everforest'})
    use('sainnhe/sonokai', {as = 'sonokai'})
    use 'olimorris/onedarkpro.nvim'
    use 'rebelot/kanagawa.nvim' -- Best tbh
    -- THEMES END

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                          , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')

    use 'mbbill/undotree'

    -- Git plugin
    use 'tpope/vim-fugitive'

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
end)

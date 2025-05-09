-- Sets fat cursor in insert mode too
-- vim.opt.guicursor = ""

vim.cmd("colorscheme kanagawa")
vim.opt.signcolumn = "yes"

-- vim.opt.cursorline = true
-- vim.cmd("highlight LineNr guifg=#a26b99")
vim.cmd("highlight LineNr guifg=#9c9789")

vim.opt.spell = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Use the colours from the terminal I guess..?
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

local textwidth = 80
-- vim.opt.textwidth = textwidth
vim.opt.colorcolumn = tostring(textwidth)

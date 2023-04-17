-- Leader key
vim.g.mapleader = " "

-- Project navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })

-- I guess it's LSP?
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show [E]rror" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat buffer" })

-- Terminal mode
vim.keymap.set("n", "<leader>tf", ":terminal<CR>", { desc = "[T]erminal [F]ullscreen" })
vim.keymap.set("n", "<leader>tt", ":sp<CR><C-w>j:res 12<CR>:terminal<CR>", { desc = "[T]erminal Spli[t]" })
vim.keymap.set("t", "<C-\\><C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Why the hell is this not silent?
vim.keymap.set("n", "<leader>x", function()
    vim.cmd("!chmod +x %")
end, { silent = true })

-- Tab navigation
-- Note to self: g<Tab> cycles between the last used tabs
vim.keymap.set("n", "<leader>T", vim.cmd.tabnew, { desc = "New [T]ab" }) -- May remove this
vim.keymap.set("n", "<leader><C-t>", vim.cmd.tabnew, { desc = "New [T]ab" })
vim.keymap.set("n", "<C-j>", vim.cmd.tabprevious)
vim.keymap.set("n", "<C-k>", vim.cmd.tabnext)

-- There has to be a better way than this, right?
vim.api.nvim_set_keymap("i", "<C-y>", "copilot#Accept('<CR>')", { expr = true, silent = true })

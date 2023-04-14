-- Project navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })

-- I guess it's LSP?
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show [E]rror" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat buffer" })

-- Why the hell is this not silent?
vim.keymap.set("n", "<leader>x", function()
    vim.cmd("!chmod +x %")
end, { silent = true })

-- There has to be a better way than this, right?
vim.api.nvim_set_keymap("i", "<C-y>", "copilot#Accept('<CR>')", { expr = true, silent = true })

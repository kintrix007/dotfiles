vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = '[P]roject [V]iew' })
vim.api.nvim_set_keymap("i", "<C-y>", "copilot#Accept('<CR>')", {expr=true, silent=true})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap("i", "<C-y>", "copilot#Accept('<CR>')", {expr=true, silent=true})

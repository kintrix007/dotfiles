-- Leader key
vim.g.mapleader = " "

-- Run current file
vim.keymap.set("n", "<f5>", ":!./%<CR>", { desc = "Run Current File" })

-- Cursor navigation
-- Navigate editor lines more easily (when linewrap is on)
vim.keymap.set("n", "<M-j>", "gj", { desc = "Go down an editor line" })
vim.keymap.set("n", "<M-k>", "gk", { desc = "Go up an editor line" })

-- Get out of my life
-- I don't want most of what I have typed to disappear when
-- I accidentally hit <C-u> instead of <C-Y>
vim.keymap.set("i", "<C-u>", "<Nop>", { desc = "Remove Ctrl+U" })

-- Project navigation
vim.keymap.set("n", "<leader>fw", vim.cmd.Ex, { desc = "[F]older Vie[w]" })

-- Terminal
vim.keymap.set("n", "<leader>cf", ":terminal<CR>", { desc = "[C]onsole [F]ullscreen" })
vim.keymap.set("n", "<leader>cc", ":sp<CR><C-w>j:res 12<CR>:terminal<CR>", { desc = "Open [C]onsole in split view" })
vim.keymap.set("t", [[<C-\><C-\>]], [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Why the hell is this not silent?
vim.keymap.set("n", "<leader>x", function()
  vim.cmd("!chmod +x %")
end, { silent = true, desc = "Make current file executable" })

-- Tab navigation
-- Note to self: g<Tab> cycles between the last used tabs
vim.keymap.set("n", "<leader>t", vim.cmd.tabnew, { desc = "New [T]ab" }) -- May remove this
vim.keymap.set("n", "<leader><C-t>", vim.cmd.tabnew, { desc = "New [T]ab" })
vim.keymap.set("n", "<left>", vim.cmd.tabprevious, { desc = "Go to previous tab" })
vim.keymap.set("n", "<C-j>", vim.cmd.tabprevious, { desc = "Go to previous tab" })
vim.keymap.set("n", "<right>", vim.cmd.tabnext, { desc = "Go to next tab" })
vim.keymap.set("n", "<C-k>", vim.cmd.tabnext, { desc = "Go to next tab" })

-- System clipbloard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to system clipbloard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank line to system clipbloard" })
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "[P]aste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]], { desc = "[P]aste from system clipboard" })

-- Find and replace visual selection
-- User "very magic" mode by default for searching and 'Find & Replace'
vim.keymap.set("n", "<leader>r", [[:%s/\v//g<Left><Left><Left>]], { desc = "[R]eplace" })
vim.keymap.set("v", "<leader>r", [[:s/\%V\v//g<Left><Left><Left>]], { desc = "[R]eplace in [V]isual Selection" })
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("v", "/", "/\\v")

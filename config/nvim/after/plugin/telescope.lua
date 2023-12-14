local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader><C-p>", telescope.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<C-p>", telescope.git_files, { desc = "Find Files in Git Repository" })

vim.keymap.set("n", "<leader>fs", telescope.live_grep, { desc = "[F]ile [S]earch" })

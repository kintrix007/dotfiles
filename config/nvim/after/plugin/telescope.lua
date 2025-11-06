local telescope = require("telescope.builtin")

-- By file name
vim.keymap.set("n", "<leader><C-p>", telescope.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fF", telescope.find_files, { desc = "[F]ind [f]iles" })
vim.keymap.set("n", "<C-p>", telescope.git_files, { desc = "Find files in git repo" })
vim.keymap.set("n", "<leader>fg", telescope.git_files, { desc = "[F]ind files in [g]it repo" })

-- By file content
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "[F]ind in files: [g]rep" })
vim.keymap.set("v", "<leader>fs", telescope.grep_string, { desc = "[F]ind in files: [s]tring" })

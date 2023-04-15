local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'VSCode Ctrl+P' })

-- Add grep search
-- vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
-- Or:
vim.keymap.set('n', '<leader>fs', function()
    -- Handle if user does ^C
    local succ, search = pcall(vim.fn.input, "Grep > ")
    if not succ then return end

    builtin.grep_string({ search = search })
end, { desc = '[F]ile [S]earch with grep' })

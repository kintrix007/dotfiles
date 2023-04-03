local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Add grep search
-- vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
-- Or:
vim.keymap.set('n', '<leader>fs', function()
    -- `pcall` is try/catch
    local succ, search = pcall(vim.fn.input, "Grep > ")
    if not succ then return end

    builtin.grep_string({ search = search })
end)


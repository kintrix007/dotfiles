local oil = require("oil")

oil.setup {
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  keymaps = {
    -- Do not override my <C-p>!
    ["<C-p>"] = false,
    ["\\"] = "actions.preview",
  }
}

vim.keymap.set("n", "<leader>fw", oil.open, { desc = "[F]older Vie[w]" })
vim.keymap.set("n", "<leader>fW", oil.open_float, { desc = "[F]older Vie[w] floating" })

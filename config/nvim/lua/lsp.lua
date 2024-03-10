vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show [E]rror" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic" })

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP keybinds",
  callback = function(event)
    local buffermap = function(mode, bind, action, opts)
      opts["buffer"] = event.buf
      vim.keymap.set(mode, bind, action, opts)
    end

    buffermap("i", "<C-Space>", "<C-x><C-o>", { desc = "Trigger code completion" })

    buffermap("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [d]efinition" })
    buffermap("n", "K", vim.lsp.buf.hover, { desc = "Show [h]over hint" })
    buffermap("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
    buffermap("n", "<F3>", vim.lsp.buf.format, { desc = "Format buffer" })
    buffermap("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code action" })
    buffermap("n", "<leader>ff", vim.lsp.buf.format, { desc = "[F]ormat buffer" })
  end,
})

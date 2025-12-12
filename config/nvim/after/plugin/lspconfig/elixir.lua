vim.lsp.enable("elixirls")

vim.lsp.config("elixirls", {
  cmd = { "elixir-ls" },
  single_file_support = true,
  on_attach = function()
    print("Elixir LSP attached")
  end
})

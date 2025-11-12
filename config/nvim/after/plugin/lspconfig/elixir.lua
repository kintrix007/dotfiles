local lspconfig = require("lspconfig")

lspconfig.elixirls.setup {
  cmd = { "elixir-ls" },
  single_file_support = true,
  on_attach = function()
    print("Elixir LSP attached")
  end
}

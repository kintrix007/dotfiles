vim.lsp.enable("texlab")

vim.lsp.config("texlab", {
  cmd = { "texlab" },
  single_file_support = true,
  on_attach = function()
    print("texlab LSP attached")
  end
})

vim.lsp.enable("agda_ls")
vim.lsp.config("agda_ls", {
  on_attach = function()
    print "Attached Agda LS"
  end
})

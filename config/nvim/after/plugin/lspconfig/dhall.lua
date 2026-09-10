vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.lsp.enable("dhall_lsp_server")

vim.lsp.config("dhall_lsp_server", {
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

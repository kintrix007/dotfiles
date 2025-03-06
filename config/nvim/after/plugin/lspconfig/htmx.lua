local lspconfig = require("lspconfig")

lspconfig.htmx.setup {
  settings = {},
  on_attach = function()
    -- print "Attached: htmx-lsp."
  end,
}

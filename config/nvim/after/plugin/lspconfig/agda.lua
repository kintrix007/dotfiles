local lspconfig = require("lspconfig")

lspconfig.agda_ls.setup {
  on_attach = function()
    print "Attached Agda LS"
  end
}

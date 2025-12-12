local lspconfig = require("lspconfig")

vim.lsp.enable("jdtls")
vim.lsp.config("jdtls", {
  settings = {
    org = {
      eclipse = {
        jdt = {
          core = {
            formatter = {
              tabulation = {
                char = "space",
                size = 4,
              },
            },
          },
        },
      },
    },
  },
})

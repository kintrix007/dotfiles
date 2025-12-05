local lspconfig = require("lspconfig")

lspconfig.jdtls.setup {
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
}

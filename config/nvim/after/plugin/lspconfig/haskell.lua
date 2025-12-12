vim.lsp.enable("hls")
vim.lsp.config("hls", {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  single_file_support = true,
  settings = {
    haskell = {
      cabalFormattingProvider = "cabalfmt",
      formattingProvider = "stylish-haskell",
      -- formattingProvider = "fourmolu",
      plugin = {
        ["stylish-haskell"] = {
          globalOn = true,
        },
        fourmolu = {
          globalOn = true,
          config = {
            external = true,
          },
        },
        rename = {
          config = {
            diff = true,
          },
        },
      },
    },
  },
})

local lspconfig = require("lspconfig")

lspconfig['hls'].setup {
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "stylish-haskell",
        }
    }
}
local lspconfig = require("lspconfig")

lspconfig.hls.setup {
    cmd = {"haskell-language-server-wrapper", "--lsp"},
    filetypes = { "haskell", "lhaskell" },
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "stylish-haskell",
        }
    }
}

lspconfig.clangd.setup {
    cmd = { "clangd" },
    single_file_support = true,
}

lspconfig.nil_ls.setup {
    cmd = { "nil" },
}

lspconfig.metals.setup {
    cmd = { "metals" },
    capabilities = {
        workspace = {
            configuration = false,
        },
    },
}

-- lspconfig.csharp_ls.setup {}


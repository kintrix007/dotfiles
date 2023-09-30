local lspconfig = require("lspconfig")

lspconfig.nil_ls.setup {
    cmd = { "nil" },
    single_file_support = true,
}

lspconfig.bashls.setup {
    cmd = { "bash-language-server", "start" },
    filetypes = { "sh", "bash" },
    single_file_support = true,
}

lspconfig.hls.setup {
    cmd = {"haskell-language-server-wrapper", "--lsp"},
    filetypes = { "haskell", "lhaskell" },
    settings = {
        haskell = {
            cabalFormattingProvider = "cabalfmt",
            formattingProvider = "stylish-haskell",
        },
    },
    single_file_support = true,
}

lspconfig.clangd.setup {
    cmd = { "clangd" },
    single_file_support = true,
}

lspconfig.ccls.setup {
    cmd = { "ccls" },
    single_file_support = true,
}

lspconfig.lua_ls.setup {
    cmd = { "lua-language-server" },
    single_file_support = true,
}

lspconfig.metals.setup {
    cmd = { "metals" },
    capabilities = {
        workspace = {
            configuration = false,
        },
    },
    single_file_support = true,
}

-- lspconfig.csharp_ls.setup {}


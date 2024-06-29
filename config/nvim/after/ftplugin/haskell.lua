vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local root_files = {
  "stack.yaml",
  "package.yaml",
  "project.cabal",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

vim.lsp.start({
  name = "Haskell Language Server",
  cmd = {
    "haskell-language-server-wrapper",
    -- "--log-file", "/home/kin/.hls.log",
    "--lsp",
  },
  root_dir = root_dir,
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

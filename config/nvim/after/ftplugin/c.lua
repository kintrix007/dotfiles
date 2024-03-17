vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local root_files = {
  ".clangd",
  "compile_commands.json",
  "compile_flags.txt",
  "configure.ac",
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

vim.lsp.start({
  name = "Clangd Language Server",
  cmd = { "clangd" },
  root_dir = root_dir,
  single_file_support = true,

  settings = {
    -- TODO: Figure out how to set indent to 4 spaces
  }
})

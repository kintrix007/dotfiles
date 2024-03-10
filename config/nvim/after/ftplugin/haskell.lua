vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local root_files = {
  "stack.yaml",
  "package.yaml",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if root_dir == nil then
  return
end

vim.lsp.start({
  name = "Haskell Language Server",
  cmd = { "haskell-language-server-wrapper", "--lsp" },
  root_dir = root_dir,
  single_file_support = true,
})

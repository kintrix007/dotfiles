local single_file_support = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local root_files = {
  ".git",
  ".terraform",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if not single_file_support and root_dir == nil then
  return
end

vim.lsp.start({
  name = "Terraform Language Server",
  cmd = { "terraform-ls", "serve" },
  root_dir = root_dir,
  single_file_support = single_file_support,
})

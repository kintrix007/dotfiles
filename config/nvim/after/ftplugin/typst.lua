local single_file_support = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local root_files = {
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if not single_file_support and root_dir == nil then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-8", "utf-16" }

-- vim.lsp.start({
--   name = "Tinymist Language Server",
--   cmd = { "tinymist", "lsp" },
--   root_dir = root_dir,
--   single_file_support = single_file_support,
--   settings = {
--     formatterMode = "typstyle",
--     exportPdf = "never",
--   },
-- })

local single_file_support = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local root_files = {
  "elm.json",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if not single_file_support and root_dir == nil then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { 'utf-8', 'utf-16' }

vim.lsp.start({
  name = "Elm Language Server",
  cmd = { "elm-language-server" },
  root_dir = root_dir,
  single_file_support = single_file_support,
  init_options = {
    elm = {
      disableElmLSDiagnostics = false,
      elmReviewDiagnostics = "off",
      onlyUpdateDiagnosticsOnSave = false,
      skipInstallPackageConfirmation = false
    }
  }
})

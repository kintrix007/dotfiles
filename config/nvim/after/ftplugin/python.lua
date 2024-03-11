local root_files = {
  "requirements.txt",
  "setup.py",
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if root_dir == nil then
  return
end

vim.lsp.start({
  name = "Pyright",
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = root_dir,
  single_file_support = true,

  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  }
})

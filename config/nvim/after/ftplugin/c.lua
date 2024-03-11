local root_files = {
  ".clangd",
  "compile_commands.json",
  "compile_flags.txt",
  "configure.ac",
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if root_dir == nil then
  return
end

vim.lsp.start({
  name = "Clangd Language Server",
  cmd = { "clangd" },
  root_dir = root_dir,
  single_file_support = true,

  settings = {
    -- TODO: Figure out how to set indent to 4 spaces
  }
})

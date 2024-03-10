local root_files = {
  "bower.json",
  "spago.dhall",
  "spago.yaml",
  "shell.nix"
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if root_dir == nil then
  return
end

vim.lsp.start({
  cmd = { "purs", "ide", "server" },
  root_dir = root_dir,
})

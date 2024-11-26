local single_file_support = false

vim.opt.expandtab = false

local root_files = {
  "project.godot",
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if not single_file_support and root_dir == nil then
  return
end

local port = os.getenv("GDScript_Port") or "6005"

vim.lsp.start({
  name = "GDScript Language Server",
  -- cmd = vim.lsp.rpc.connect("127.0.0.1", port),
  cmd = { "nc", "localhost", port },
  root_dir = root_dir,
  single_file_support = single_file_support,
})

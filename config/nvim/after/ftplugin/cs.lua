local single_file_support = false

local root_files = {
  -- FIXME: Glob patterns don't work
  "*.sln",
  "*.csproj",
  "omnisharp.json",
  "function.json",
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if not single_file_support and root_dir == nil then
  return
end

print("Loading OmniSharp...")

local pid = vim.fn.getpid()

vim.lsp.start({
  name = "OmniSharp Language Server",
  cmd = { "OmniSharp", "-lsp", "--hostPID", tostring(pid) },
  root_dir = root_dir,
  single_file_support = single_file_support,
  on_attach = function()
    print("OmniSharp attached.")
  end
})

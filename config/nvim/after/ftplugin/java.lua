local single_file_support = true

local root_files = {
  "settings.gradle",
  "settings.gradle.kts",
  -- "build.gradle",
  -- "build.gradle.kts",
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if not single_file_support and root_dir == nil then
  return
end

vim.lsp.start({
  name = "Java Language Server",
  cmd = { "java-language-server" },
  root_dir = root_dir,
  single_file_support = single_file_support,
})

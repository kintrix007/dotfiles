local single_file_support = true

local root_files = {
  "Cargo.toml",
  "rust-project.json",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if not single_file_support and root_dir == nil then
  return
end

vim.lsp.start({
  name = "Rust Analyzer",
  cmd = { "rust-analyzer" },
  root_dir = root_dir,
  single_file_support = single_file_support,
})

local function setup_tsserver()
  local root_files = {
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    ".git",
  }

  local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
  local root_dir = vim.fs.dirname(paths[1])

  if root_dir == nil then
    return
  end

  vim.lsp.start({
    name = "TypeScript Language Server",
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = root_dir,
    single_file_support = true,
    init_options = {
      hostInfo = "neovim",
    }
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript", "javascriptreact",
    "typescript", "typescriptreact"
  },
  desc = "Start TypeScript Language Server",
  callback = setup_tsserver,
})

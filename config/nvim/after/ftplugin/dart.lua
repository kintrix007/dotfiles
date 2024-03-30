local root_files = {
  "pubspec.yaml",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

vim.lsp.start({
  name = "Dart Language Server",
  cmd = { "dart", "language-server", "--protocol=lsp" },
  root_dir = root_dir,

  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },

  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    }
  }
})

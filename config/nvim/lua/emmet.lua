-- * This file will not get sourced

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "css,eruby,html,htmldjango,javascriptreact,less,pug,sass,scss,typescriptreact",
  callback = function()
    vim.lsp.start({
      cmd = { "emmet-ls", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
      single_file_support = true,
      -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
      -- **Note:** only the options listed in the table are supported.
      init_options = {
        html = {
          options = {
            ["bem.enabled"] = true,
          },
        },
      },
    })
  end,
})

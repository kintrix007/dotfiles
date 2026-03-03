vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.lsp.enable("csharp_ls")
vim.lsp.config("csharp_ls", {
  cmd = function(dispatchers, config)
    local cmd = { "csharp-ls", "--features", "razor-support" }
    return vim.lsp.rpc.start(cmd, dispatchers, {
      -- csharp-ls attempt to locate sln, slnx or csproj files from cwd, so set cwd to root directory.
      -- If cmd_cwd is provided, use it instead.
      cwd = config.cmd_cwd or config.root_dir,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  on_attach = function()
    print("csharp-ls attached.")
  end,
  filetypes = { "cs", "cshtml" },
})

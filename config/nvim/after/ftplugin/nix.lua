vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local root_files = {
  "configuration.nix",
  "shell.nix",
  "flake.nix",
  ".git",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

local home_manager_config_path = vim.env.HOME .. "/.config/home-manager/home.nix"

local nixpkgs_path = vim.env.HOME .. "/nixos-config/nixpkgs"

print(nixpkgs_path)

local nixd_options = {
  nixos = {
    expr = string.format("(import %s {}).options", nixpkgs_path)
    -- expr = "(import <nixpkgs/modules> { }).options",
    -- ? For flake setup?
    -- expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
  },
}

if vim.fn.filereadable(vim.fn.expand(home_manager_config_path)) == 1 then
  nixd_options["home_manager"] = {
    expr = string.format([=[
      (import <home-manager/modules> {
        configuration = %s;
        pkgs = import <nixpkgs> {};
      }).options
    ]=], home_manager_config_path)
  }
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

vim.lsp.start({
  name = "Nixd Language Server",
  cmd = { "nixd" },
  root_dir = root_dir,
  single_file_support = true,

  capabilities = capabilities,

  settings = {
    nixd = {
      nixpkgs = {
        -- expr = "(import <nixpkgs> { }).pkgs",
        expr = string.format("(import %s { }).pkgs", nixpkgs_path),
      },

      formatting = {
        command = { "nixfmt" },
      },

      options = nixd_options,
    },
  },
})

-- vim.lsp.start({
--   name = "Nil Language Server",
--   cmd = { "nil" },
--   root_dir = root_dir,
--   single_file_support = true,
--
--   settings = {
--     ["nil"] = {
--       formatting = {
--         command = { "nixfmt" },
--       },
--     },
--   },
-- })

local root_files = {
  ".luarc.json",
  ".luarc.jsonc",
  ".luacheckrc",
  ".stylua.toml",
  "stylua.toml",
  "selene.toml",
  "selene.yml",
}

local paths = vim.fs.find(root_files, { upward = true, stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if root_dir == nil then
    return
end

vim.lsp.start({
    name = "Lua Language Server",
    cmd = { "lua-language-server" },
    root_dir = root_dir,
    single_file_support = true,
})

local lint = require("lint")

local linters = {
  markdown = { "markdownlint" },
  -- Does not allow global config...
  -- gitcommit = { "commitlint" },
  gitcommit = { "gitlint" },
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  python = { "flake8" },
  gdscript = { "gdlint" },
  html = { "tidy" },
  closure = { "joker", "--lint" },
  -- Bash Language Server already uses it by default
  -- sh = { "shellcheck" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
}

local triggers = {
  "BufEnter",
  "BufWritePost",
  "TextChanged",
  "InsertLeave",
}

for ft, linter in pairs(linters) do
  local cmd = linter[1]

  if vim.fn.executable(cmd) == 1 then
    lint.linters_by_ft[ft] = linter
  end
end

vim.api.nvim_create_autocmd(triggers, {
  callback = function()
    lint.try_lint()
  end,
})

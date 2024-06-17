local lint = require("lint")

local linters = {
  markdown = { "markdownlint" },
  rst = { "vale" },
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
  terraform = { "tflint" },
  dockerfile = { "hadolint" },
  clojure = { "clj-kondo" },
  janet = { "janet" },
}

local triggers = {
  "BufEnter",
  "BufWinEnter",
  "BufWritePost",
  -- Not a good idea for all linters.
  -- I should separate the ones that actually support this.
  "TextChanged",
  "InsertLeave",
}

print(vim.inspect(lint.linters_by_ft))
lint.linters_by_ft = {}

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

local lint = require("lint")

local linters_by_ft = {
  markdown = { "markdownlint", "cspell" },
  rst = { "vale" },
  -- Does not allow global config...
  -- gitcommit = { "commitlint" },
  gitcommit = { "gitlint", "cspell" },
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  python = { "flake8" },
  gdscript = { "gdlint" },
  html = { "tidy" },
  closure = { "joker" },
  -- Bash Language Server already uses it by default
  -- sh = { "shellcheck" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  terraform = { "tflint" },
  dockerfile = { "hadolint" },
  clojure = { "clj-kondo" },
  janet = { "janet" },
  sql = { "sqlfluff" },
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

-- Override sqlfluff args to NOT specify dialect
lint.linters.sqlfluff.args = { "lint", "--format=json" }

local function is_executable(path)
  return vim.fn.executable(path) == 1
end

local function get_linter_command(linter_name)
  local linter_data = lint.linters[linter_name]
  if type(linter_data) == "function" then
    linter_data = linter_data()
  end

  local executable_name = linter_data.cmd
  if type(executable_name) == "function" then
    executable_name = executable_name()
  end

  return executable_name
end

lint.linters_by_ft = {}
for ft, linter_list in pairs(linters_by_ft) do
  lint.linters_by_ft[ft] = {}

  for _, linter in ipairs(linter_list) do
    local executable_name = get_linter_command(linter)

    if is_executable(executable_name) then
      table.insert(lint.linters_by_ft[ft], linter)
    end
  end
end

vim.api.nvim_create_autocmd(triggers, {
  callback = function()
    -- print(vim.inspect(lint.linters_by_ft))

    local is_normal_buffer = vim.o.buftype == ""
    if is_normal_buffer then
      lint.try_lint()
    end
  end,
})

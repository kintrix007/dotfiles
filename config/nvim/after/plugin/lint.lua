local lint = require("lint")

lint.linters_by_ft = {
  markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})

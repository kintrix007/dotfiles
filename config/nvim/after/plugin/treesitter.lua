local treesitter = require("nvim-treesitter")

---@param buf integer
---@param language string
local function treesitter_try_attach(buf, language)
  -- print("adding language " .. language)
  if vim.treesitter.language.add(language) then
    -- print("success: " .. language)
    vim.treesitter.start(buf, language)
  else
    -- print("fail: " .. language)
  end

  -- Enable treesitter based folds
  -- For more info on folds see `:help folds`
  -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  -- vim.wo.foldmethod = 'expr'

  -- Check if treesitter indentation is available for this language, and if so enable it
  -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
  -- local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

  -- Enable treesitter based indentation
  -- if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
  desc = "Try to enable tree-sitter syntax highlighting",
  pattern = "*", -- run on *all* filetypes
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end

    treesitter_try_attach(buf, language)
  end,
})

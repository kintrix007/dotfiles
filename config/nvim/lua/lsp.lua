vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show [E]rror" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Go to next [d]iagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Go to previous [d]iagnostic" })

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP keybinds",
  callback = function(event)
    local buffermap = function(mode, bind, action, opts)
      opts["buffer"] = event.buf
      vim.keymap.set(mode, bind, action, opts)
    end

    buffermap("i", "<C-Space>", "<C-x><C-o>", { desc = "Trigger code completion" })

    buffermap("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [d]efinition" })
    buffermap("n", "gD", vim.lsp.buf.declaration, { desc = "[G]o to [d]eclaration" })
    buffermap("n", "gi", vim.lsp.buf.implementation, { desc = "[G]o to [i]mplementation" })
    buffermap("n", "go", vim.lsp.buf.type_definition, { desc = "[G]o to type definition" })
    buffermap("n", "gr", vim.lsp.buf.references, { desc = "[G]o the [r]eferences" })
    buffermap("n", "K", vim.lsp.buf.hover, { desc = "Show hover hint" })
    buffermap({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "Show Signature help" })
    buffermap("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })
    buffermap("n", "<F3>", vim.lsp.buf.format, { desc = "Format buffer" })
    buffermap("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code action" })
    buffermap("n", "<leader>ff", vim.lsp.buf.format, { desc = "[F]ormat buffer" })
  end,
})

-- Add borders to floating windows --

vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

-- Set diagnostic signs --

-- TODO: Remove v0.9 compat once v0.10 is out
local function set_up_signs_9(opts)
  local function sign_define(args)
    vim.fn.sign_define(args.name, {
      texthl = args.name,
      text = args.text,
      numhl = ''
    })
  end

  sign_define({ name = "DiagnosticSignError", text = opts.error })
  sign_define({ name = "DiagnosticSignWarn", text = opts.warn })
  sign_define({ name = "DiagnosticSignHint", text = opts.hint })
  sign_define({ name = "DiagnosticSignInfo", text = opts.info })
end

local function set_up_signs_10(opts)
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = opts.error,
        [vim.diagnostic.severity.WARN] = opts.warn,
        [vim.diagnostic.severity.HINT] = opts.hint,
        [vim.diagnostic.severity.INFO] = opts.info,
      },
    },
  })
end

local ver = vim.version()
local set_signs
if (ver.minor > 9) then
  set_signs = set_up_signs_10
else
  set_signs = set_up_signs_9
end

set_signs {
  error = "!!",
  warn = "!",
  hint = "?",
  info = "i",
}

-- Enable simple tab completion --

vim.opt.completeopt = { "menuone", "noinsert" }
-- If you get too many messages printed, look into this:
-- vim.opt.shortmess:append("c")

local function tab_complete()
  local in_popup = vim.fn.pumvisible() ~= 0

  if in_popup then
    return "<Down>"
  end

  local c = vim.fn.col('.') - 1
  local is_whitespace = c == 0 or vim.fn.getline('.'):sub(c, c):match('%s')

  if is_whitespace then
    return "<Tab>"
  end

  -- I do not really understand why this works
  local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'

  if lsp_completion then
    -- trigger lsp code completion
    return '<C-x><C-o>'
  end

  -- suggest words in current buffer
  return '<C-x><C-n>'
end

local function tab_prev()
  local in_popup = vim.fn.pumvisible() ~= 0

  if in_popup then
    return "<Up>"
  end

  return "<Tab>"
end

local function complete()
  local in_popup = vim.fn.pumvisible() ~= 0
  local c = vim.fn.col('.') - 1
  local is_whitespace = c == 0 or vim.fn.getline('.'):sub(c, c):match('%s')

  if in_popup or is_whitespace then
    return "<C-y>"
  end

  return "<C-x><C-o><C-y>"
end

vim.keymap.set("i", "<Tab>", tab_complete, { expr = true })
vim.keymap.set("i", "<S-Tab>", tab_prev, { expr = true })
vim.keymap.set("i", "<C-y>", complete, { expr = true })

local dap = require("dap")

-- Breakpoints
vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "Toggle [B]reakpoint" })
vim.keymap.set("n", "<leader>bl", dap.toggle_breakpoint, { desc = "Put [B]reakpoint [L]ist in Quickfix List" })

-- Stepping
vim.keymap.set("n", "<down>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<right>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<left>", dap.step_out, { desc = "Step Over" })
vim.keymap.set("n", "<up>", function()
  local session = dap.session()

  if session.capabilities.supportsStepBack then
    dap.step_back()
  elseif session.capabilities.supportsRestartFrame then
    dap.utils.notify("Step back unsupported. Restarting frame instead.", vim.log.levels.WARN)
    print()
    dap.restart_frame()
  else
    require("dap.utils").notify("Debug Adapter does not support step back nor restart frame.", vim.log.levels.ERROR)
  end
end, { desc = "Step Back" })

-- Hovering
vim.keymap.set({ 'n', 'v' }, '<Leader>k', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader><S-k>', function()
  require('dap.ui.widgets').preview()
end)


-- Misc
vim.keymap.set("n", "<leader>br", dap.repl.open, { desc = "Open De[b]ugging [R]epl" })
vim.keymap.set("n", "<leader>bc", dap.run_to_cursor, { desc = "Run to [C]ursor" })
vim.keymap.set("n", "<leader>bn", ":DapNew", { desc = "Create [N]ew DAP context" })

-- vim.keymap.set("n", "<right>", function()
--   dap.step_into { askForTargets = true }
-- end, { desc = "Step Into" })

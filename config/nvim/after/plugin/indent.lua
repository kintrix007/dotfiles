local indent = require("ibl")

local highlight = {
    "RainbowOrange",
    -- "RainbowViolet",
    -- "RainbowBlue",
    -- "RainbowGreen",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
end)
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- vim.g.rainbow_delimiters = { highlight = highlight }

indent.setup {
    indent = {
        char = '┊',
        -- char = '▏',
    },
    scope = {
        enabled = true,
        highlight = highlight,
        -- char = '┊',
        -- char = '▏',
        show_start = false,
        show_end = false,
    },
}

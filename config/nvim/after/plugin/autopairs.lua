local autopairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

autopairs.setup {
    check_ts = true,
    disable_in_visalblock = true,
}

-- TODO: Do that same with single quotes too, maybe?

-- print(vim.inspect(autopairs.get_rules('"')))
local quote_rules = autopairs.get_rules('"')

-- This is the part that could need maintenance when the plugin changes...
for _, rule in pairs(quote_rules) do
    local regex = [=[[%w%d%%%.%!%'%$%)%]%}]]=]
    local filetypes = rule.filetypes

    if filetypes ~= nil and #filetypes == 1 and filetypes[1] == "vim" then
        -- The extension has different rules for vimscript
        rule:with_pair(cond.not_before_regex(regex))
    else
        rule:with_pair(cond.not_before_regex(regex))
    end
end

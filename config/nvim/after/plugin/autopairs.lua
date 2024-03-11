local autopairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

autopairs.setup {
    check_ts = true,
    disable_in_visalblock = true,
}

local function do_not_close_quote(rules, quote)
    -- Also add the other kind of quote not to auto-close after
    local regex = [=[[%w%d%%%.%!]=] .. "%" .. quote .. [=[%$%)%]%}]]=]
    for _, rule in pairs(rules) do
        rule:with_pair(cond.not_before_regex(regex))
    end
end

-- print(vim.inspect(autopairs.get_rules('"')))
-- This is the part that could need maintenance when the plugin changes...
do_not_close_quote(autopairs.get_rules('"'), "'")
do_not_close_quote(autopairs.get_rules("'"), '"')
do_not_close_quote(autopairs.get_rules("`"), '`')

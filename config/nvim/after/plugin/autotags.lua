local autotag = require("nvim-ts-autotag")
autotag.setup {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
  per_filetype = {
    -- These have the same schema as `opts` above
    ["html"] = {
      enable_close = true,
    }
  },
}

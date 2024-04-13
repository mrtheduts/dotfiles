return { -- https://github.com/folke/tokyonight.nvim
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = true,
  },
  config = function(_, opts)
    local tokyonight = require("tokyonight")
    tokyonight.setup(opts)
    tokyonight.load()
  end,
}

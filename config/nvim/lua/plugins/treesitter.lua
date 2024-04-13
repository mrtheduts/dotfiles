return { -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "python", "c", "javascript", "typescript", "java", "lua", "vim", "vimdoc", "query" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "astro",
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "markdown",
    },
    opts = {},
  },
}

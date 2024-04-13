return { -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  keys = {
    { "<leader>p", "<cmd>Telescope find_files<CR>" },
    { "<C-p>", "<cmd>Telescope git_files<CR>" },
  },
}

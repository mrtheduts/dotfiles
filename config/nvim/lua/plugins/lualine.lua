return { -- https://github.com/nvim-lualine/lualine.nvim
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
          theme = 'ayu_mirage',
          sections = {
              lualine_a = {'buffers'},
              lualine_b = {},
              lualine_c = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = {'tabs'}
          }
      }
    }
  end,
}

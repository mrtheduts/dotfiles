return {
  'hrsh7th/nvim-cmp',
  config = function(_, opts)
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),
      
        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
      
        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      
        -- Scroll up and down in the completion documentation
        ['<C-h>'] = cmp.mapping.scroll_docs(-4),
        ['<C-l>'] = cmp.mapping.scroll_docs(4),
      
        -- Select above and down autocomplete suggestion
        ['<C-k>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-j>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    })
  })
  end,
}
-- local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
-- 

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    -- https://github.com/wbthomason/packer.nvim
    use 'wbthomason/packer.nvim'

    -- Telescope
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        }
    }

    -- Monokai
    -- https://github.com/tanvirtin/monokai.nvim
    use 'tanvirtin/monokai.nvim'

    -- Treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    -- use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Harpoon
    -- https://github.com/ThePrimeagen/harpoon
    use 'ThePrimeagen/harpoon'

    -- Undotree
    -- https://github.com/mbbill/undotree
    use 'mbbill/undotree'

    -- Surround
    -- https://github.com/tpope/vim-surround
    use 'tpope/vim-surround'

    -- Comentary
    -- https://github.com/tpope/vim-commentary
    use 'tpope/vim-commentary'

    -- LSP-Zero
    -- https://github.com/VonHeikemen/lsp-zero.nvim
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Linter integration
            { 'mfussenegger/nvim-lint' },

            -- Formatter integration
            { 'mhartington/formatter.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            -- { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Lualine
    -- https://github.com/nvim-lualine/lualine.nvim
    use { 'nvim-lualine/lualine.nvim' }

    -- Web devicons
    -- https://github.com/nvim-tree/nvim-web-devicons
    use 'nvim-tree/nvim-web-devicons'

    -- nvim-tree
    -- https://github.com/nvim-tree/nvim-tree.lua
    use {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- Git signs
    -- https://github.com/lewis6991/gitsigns.nvim
    use {
        'lewis6991/gitsigns.nvim',
          -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
        config = function()
            require('gitsigns').setup()
          end
    }

    -- Leap
    -- https://github.com/ggandor/leap.nvim
    use {
        'ggandor/leap.nvim',
        requires = {
            { 'tpope/vim-repeat' },
        }
    }

end)

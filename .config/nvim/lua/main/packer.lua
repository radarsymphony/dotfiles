-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup({
                highlight_groups = {
                    ColorColumn = { bg = '' },

                    -- Blend colours against the "base" background
                    CursorLine = { bg = 'foam', blend = 30 },
                }
            })
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    -- use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use('airblade/vim-gitgutter')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    -- install without yarn or npm
    use({
        'prettier/vim-prettier',
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use('Exafunction/codeium.vim')
    use 'Exafunction/codeium.vim'

    -- use {
        --     'chipsenkbeil/distant.nvim',
        --     config = function()
            --         require('distant').setup {
                --             -- Applies Chip's personal settings to every machine you connect to
                --             --
                --             -- 1. Ensures that distant servers terminate with no connections
                --             -- 2. Provides navigation bindings for remote directories
                --             -- 3. Provides keybinding to jump into a remote file's parent directory
                --             ['*'] = require('distant.settings').chip_default()
                --         }
                --     end
                -- }

            end)


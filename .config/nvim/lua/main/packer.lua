-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
    --use({
    --    'rose-pine/neovim',
    --    as = 'rose-pine',
    --    config = function()
    --        require("rose-pine").setup()
    --        vim.cmd('colorscheme rose-pine')
    --    end
    --})

	-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- use('nvim-treesitter/playground')

	use('theprimeagen/harpoon')

	use('mbbill/undotree')

	use('tpope/vim-fugitive')

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

   -- use {
   --     "lewis6991/hover.nvim",
   --     config = function()
   --         require("hover").setup {
   --             init = function()
   --                 -- Require providers
   --                 require("hover.providers.lsp")
   --                 -- require('hover.providers.gh')
   --                 -- require('hover.providers.gh_user')
   --                 -- require('hover.providers.jira')
   --                 require('hover.providers.man')
   --                 require('hover.providers.dictionary')
   --             end,
   --             preview_opts = {
   --                 border = nil
   --             },
   --             -- Whether the contents of a currently open hover window should be moved
   --             -- to a :h preview-window when pressing the hover keymap.
   --             preview_window = false,
   --             title = true
   --         }

   --         -- Setup keymaps
   --         vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
   --         vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
   --     end
   -- }

end)


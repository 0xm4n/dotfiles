-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require('packer').startup(function(use)
	-- Packer can manage itself
	--
	use 'wbthomason/packer.nvim'
	-- Git diff view
	use "sindrets/diffview.nvim"
	-- vim-illuminate
	use 'RRethy/vim-illuminate'
	-- copilot.vim
	use 'github/copilot.vim'
	-- tmux-copy
	use 'wincent/vim-clipper'
	-- (Vim) Git
	use 'tpope/vim-fugitive'
	-- (Vim) Git-messenger : show git commit
	use 'rhysd/git-messenger.vim'
	-- Gitsigns : show git modified line
	use 'lewis6991/gitsigns.nvim'
	-- Color theme
	use 'sainnhe/sonokai'
	-- (Vim) Clipboard : copy into system clipboard
	use 'ojroques/nvim-osc52'
	-- Move lines and blocks : move multiple line up and down
	use 'fedepujol/move.nvim'
	-- Treesitter
	use("nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})
	-- Symbol outline
	use 'preservim/tagbar'
	-- Toggle terminal
	use {"akinsho/toggleterm.nvim", tag = '*'}
	-- Icons
	use {'nvim-tree/nvim-web-devicons'}
	-- Quickfix enter
	use {'yssl/QFEnter'}
	-- Indentation guides line
	use "lukas-reineke/indent-blankline.nvim"
	-- Bookmarks
	use "MattesGroeger/vim-bookmarks"
	-- Undo history visualizer
	use 'mbbill/undotree'
	-- window.nvim
	use {
		"anuvyklack/windows.nvim",
		requires = "anuvyklack/middleclass",
		config = function()
			vim.o.winwidth = 15
			vim.o.winminwidth = 15
			vim.o.equalalways = false
			require('windows').setup()
		end
	}
	-- hop.nvim
	use {
		'phaazon/hop.nvim',
		config = function()
			require('hop').setup {}
		end
	}
	-- nvim-surronund
	use {
		'kylechui/nvim-surround',
		config = function()
			require('nvim-surround').setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- Comment.nvim
	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}
	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- autopairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	-- subtitute.nvim : yank and paste
	use({
		"gbprod/substitute.nvim",
		config = function() require("substitute").setup({}) end
	})
	-- Tab line
	use {
		'akinsho/bufferline.nvim', tag = "*",
		requires = 'nvim-tree/nvim-web-devicons'
	}
	-- nvim-tree : file tree
	use {
		'nvim-tree/nvim-tree.lua',
		-- requires = {
		-- 	'nvim-tree/nvim-web-devicons', -- optional, for file icons
		-- },
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	-- Debugger
	use {
		{'mfussenegger/nvim-dap'},
		{'rcarriga/nvim-dap-ui'},
		{'theHamsta/nvim-dap-virtual-text'},
		{'nvim-telescope/telescope-dap.nvim'},
	}
	-- greeter
	use {
		'goolord/alpha-nvim',
		-- requires = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	}
	-- Pretty list for showing diagnostics
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	-- winbar
	use({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		after = "nvim-web-devicons", -- keep this if you're using NvChad
		config = function()
			require("barbecue").setup({
				-- attach_navic = false,
				-- show_navic = false,
			})
		end,
	})
	-- clangd process
	use ({
		'j-hui/fidget.nvim',
		tag = 'legacy',
	})
	-- LSP Support
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip', run = "make install_jsregexp"}, -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
	use 'p00f/clangd_extensions.nvim'
end)


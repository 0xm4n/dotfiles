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
	use 'wbthomason/packer.nvim'
	-- (Vim) Git
	use 'tpope/vim-fugitive'
	-- (Vim) Git-messenger : show git commit
	use 'rhysd/git-messenger.vim'
	-- Gitsigns : show git modified line
	use 'lewis6991/gitsigns.nvim'
	-- Color theme
	use 'Mofiqul/vscode.nvim'
	use 'folke/tokyonight.nvim'
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
	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
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
		'akinsho/bufferline.nvim', tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons'
	}
	-- Smooth scrolling
	use {
		'karb94/neoscroll.nvim',
		config = function() require('neoscroll').setup() end
	}
	-- nvim-tree : file tree
	use {
		'nvim-tree/nvim-tree.lua',
		-- requires = {
		-- 	'nvim-tree/nvim-web-devicons', -- optional, for file icons
		-- },
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
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
			require("barbecue").setup()
		end,
	})
	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
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
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
	-- Highlight word under the cursor
	-- use {
	-- 	"RRethy/vim-illuminate",
	-- }
	-- which-key
	-- use {"folke/which-key.nvim"}
	-- use 'simrat39/symbols-outline.nvim'
	-- use {
	-- 	'romgrk/barbar.nvim',
	-- 	-- requires = 'nvim-web-devicons'
	-- }
	-- Gitgutter
	-- use 'airblade/vim-gitgutter'
	-- Folding
	-- use {
	-- 	'kevinhwang91/nvim-ufo',
	-- 	requires = {
	-- 		'kevinhwang91/promise-async',
	-- 	},
	-- }
	-- Status line
	-- use {
	-- 	'vim-airline/vim-airline',
	-- 	requires = 'vim-airline/vim-airline-themes',
	-- }
end)

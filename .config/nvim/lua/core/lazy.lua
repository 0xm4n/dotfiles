local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	{ "tpope/vim-repeat" },
	{
		"tpope/vim-surround",
		event = { "BufReadPre", "BufNewFile" },
	},
	{ "tpope/vim-fugitive" },
	{ "ntpeters/vim-better-whitespace" },
	{ "0xm4n/resize.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "stevearc/dressing.nvim" },
	{ "kevinhwang91/nvim-bqf" },
	{ "rhysd/git-messenger.vim" },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	{ "sainnhe/sonokai" },
	{ "ojroques/nvim-osc52" },
	{ "liuchengxu/vista.vim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "MattesGroeger/vim-bookmarks" },
	{ "mbbill/undotree" },
	{ "yssl/QFEnter" },
	-- { "RRethy/vim-illuminate" },
	{ "nvim-tree/nvim-web-devicons" },
	-- { "github/copilot.vim" },
	{
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
			}
		end

	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			lazy = true
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	event = { "BufReadPost", "BufNewFile" },
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter"
	-- 	},
	-- },
	{
		"akinsho/toggleterm.nvim",
		version = "*"
	},
	{
		"phaazon/hop.nvim",
		config = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.x",
		dependencies = {
			{"nvim-lua/plenary.nvim"},
		}
	},
	{
		'goolord/alpha-nvim',
		config = function ()
			local dashboard = require("alpha.themes.startify")
			require'alpha'.setup(dashboard.config)
		end
	},
	{
		"rcarriga/nvim-notify",
		config = function ()
			require("notify").setup {
				stages = "static",
				background_colour = "FloatShadow",
				timeout = 3000,
			}
			vim.notify = require("notify")
		end
	},
	{
		"numToStr/Comment.nvim",
		-- event = { "BufReadPre", "BufNewFile" },
		config = true
	},
	{
		"windwp/nvim-autopairs",
		config = true
	},
	{
		"gbprod/substitute.nvim",
		config = true
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons"
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "nightly"
	},
	{
		{"mfussenegger/nvim-dap"},
		{"rcarriga/nvim-dap-ui"},
		{"theHamsta/nvim-dap-virtual-text"},
		{"nvim-telescope/telescope-dap.nvim"},
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = true
	},
	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = true,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = true
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
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

			-- Misc
			{'onsails/lspkind.nvim'},
			{'p00f/clangd_extensions.nvim'},
		}
	},
	{
		'nvimdev/lspsaga.nvim',
		config = true
	},
})
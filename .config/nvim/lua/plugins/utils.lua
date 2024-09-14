return {
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 8
		end,
	},
	-- {
	-- 	"github/copilot.vim",
	-- 	config = function ()
	-- 		vim.cmd [[
	-- 		let g:copilot_filetypes = {
	-- 		      \ '*': v:false,
	-- 		      \ 'c': v:true,
	-- 		      \ 'python': v:true,
	-- 		      \ 'lua': v:true,
	-- 		      \ }
	-- 		]]
	-- 	end
	-- },
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"ntpeters/vim-better-whitespace",
		event = "VeryLazy",
		config = function ()
		vim.cmd [[
		let g:better_whitespace_ctermcolor='darkgrey'
		let g:better_whitespace_guicolor='darkgrey'
		let g:strip_whitespace_on_save=0
		let g:strip_whitelines_at_eof=0
		]]
		end
	},
	{
		"0xm4n/resize.nvim",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		version = "2.20.8",
		config = function ()
			require("indent_blankline").setup {
			    show_current_context = true,
			    show_current_context_start = false,
			}
			vim.g.indent_blankline_char = '¦'
			vim.g.indent_blankline_char_blankline = ' '
			vim.g.indent_blankline_show_first_indent_level = false
			vim.g.filetype_exclude = {
				"help", "alpha", "dashboard",
				"neo-tree", "Trouble", "lazy"
			}
		end,
	},
	{
		"ojroques/nvim-osc52",
		event = "VeryLazy",
		config = function ()
			require('osc52').setup {
				silent = true,
				tmux_passthrough = true,
			}
			function copy()
			  if vim.v.event.operator == 'y' then
			    require('osc52').copy_visual()
			  end
			end
			vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
		end
	},
	{
		"mbbill/undotree",
		config = function ()
			vim.cmd [[
			if has("persistent_undo")
			   let target_path = expand('~/.undodir')
			    if !isdirectory(target_path)
				call mkdir(target_path, "p", 0700)
			    endif

			    let &undodir=target_path
			    set undofile
			endif
			]]
		end
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"phaazon/hop.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		'ThePrimeagen/harpoon',
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension "harpoon"
		end
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		config = true,
		event = "VeryLazy",
	},
	{
		"gbprod/substitute.nvim",
		event = "VeryLazy",
		config = true
	},
	{
		"kevinhwang91/nvim-bqf",
		event = "VeryLazy",
		config = function ()
		require('bqf').setup({
			preview = {
				auto_preview = false,
				win_height = 999,
			}
		})
		end
	},
	{
		"yssl/QFEnter",
		event = "VeryLazy",
	},
	{
		"liuchengxu/vista.vim",
	},
}


return {
	{
		"sainnhe/sonokai",
		config = function()
			local colorscheme = "sonokai"

			vim.cmd [[
			let g:sonokai_style = 'andromeda'
			let g:sonokai_better_performance = 1
			]]

			local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
			if not status_ok then
				return
			end
		end,
	},
	{
		"stevearc/dressing.nvim",
		lazy = true
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
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
		'goolord/alpha-nvim',
		config = function ()
			local dashboard = require("alpha.themes.startify")
			require'alpha'.setup(dashboard.config)
		end
	},
}



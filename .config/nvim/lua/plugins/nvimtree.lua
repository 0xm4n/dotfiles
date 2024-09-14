return {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	version = "nightly",
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({
			update_focused_file = {
				enable = true,
			},
			view = {
				width = 40
			}
		})
	end,
}


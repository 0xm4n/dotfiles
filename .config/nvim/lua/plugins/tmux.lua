return {
	"christoomey/vim-tmux-navigator",
	event = "VeryLazy",
	config = function ()
		vim.cmd [[
		let g:tmux_navigator_no_mappings = 1
		]]
	end,
}


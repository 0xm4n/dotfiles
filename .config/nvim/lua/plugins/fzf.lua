return {
	-- {
	-- 	"junegunn/fzf.vim",
	-- 	config = function()
	-- 		vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
	-- 		vim.g.fzf_action = {
	-- 			["Esc"] = "abort",
	-- 			["ctrl-t"] = "tab split",
	-- 			["ctrl-x"] = "split",
	-- 			["ctrl-v"] = "vsplit",
	-- 		}
	-- 	end,
	-- 	dependencies = { { 'junegunn/fzf' } },
	-- }
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({
			})
		end,
	}
}

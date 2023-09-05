require'nvim-treesitter.configs'.setup {
	-- ensure_installed = { "c", "cpp", "python", "lua", "bash", "yaml", "json"},
	sync_install = false,
	auto_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- textobjects = {
	-- 	select = {
	-- 		enable = true,
	--
	-- 		-- Automatically jump forward to textobj, similar to targets.vim
	-- 		lookahead = true,
	--
	-- 		keymaps = {
	-- 			["af"] = "@function.outer",
	-- 			["if"] = "@function.inner",
	-- 			["as"] = "@class.outer",
	-- 			["is"] = "@class.inner",
	-- 			["ap"] = "@parameter.outer",
	-- 			["ip"] = "@parameter.inner",
	-- 		},
	-- 		include_surrounding_whitespace = true,
	-- 	},
	-- 	move = {
	-- 		enable = true,
	-- 		set_jumps = true, -- whether to set jumps in the jumplist
	-- 		goto_previous_start = {
	-- 			["[f"] = "@function.outer",
	-- 			["[s"] = "@class.outer",
	-- 		},
	-- 		goto_next_end = {
	-- 			["]f"] = "@function.outer",
	-- 			["]s"] = "@class.outer",
	-- 		},
	-- 		goto_next = {
	-- 			["]d"] = "@conditional.outer",
	-- 		},
	-- 		goto_previous = {
	-- 			["[d"] = "@conditional.outer",
	-- 		}
	-- 	},
	-- 	lsp_interop = {
	-- 		enable = true,
	-- 		border = 'none',
	-- 		peek_definition_code = {
	-- 			['<leader>pf'] = '@function.outer',
	-- 			['<leader>ps'] = '@class.outer'
	-- 		},
	-- 	},
	-- },
}


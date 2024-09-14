return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = "0.1.x",
	config = function()
		local actions = require "telescope.actions"
		require('telescope').setup {
			defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--line-number",
					"--with-filename",
					"--column",
					"--smart-case",
					"--hidden",
					"--ignore-file",
					".gitignore",
				},
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				-- layout_strategy = 'flex',
				-- scroll_strategy = 'limit',  -- do not cycle!
				layout_config = {
					prompt_position = "bottom",
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.9,
					},
					vertical = {
						mirror = false,
					},
					width = 0.90,
					height = 0.80,
					preview_cutoff = 0,
				},
				file_ignore_patterns = { "node_modules" },
				path_display = { "truncate" },
				winblend = 10,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<ScrollWheelUp>"] = actions.move_selection_previous,
						["<ScrollWheelDown>"] = actions.move_selection_next,
						["<C-c>"] = actions.close,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<PageUp>"] = actions.preview_scrolling_up,
						["<PageDown>"] = actions.preview_scrolling_down,
						["<C-ScrollWheelUp>"] = actions.preview_scrolling_up,
						["<C-ScrollWheelDown>"] = actions.preview_scrolling_down,
						["<C-u>"] = actions.results_scrolling_up,
						["<C-d>"] = actions.results_scrolling_down,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.complete_tag,
						["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					},
					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,
						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,
						["<PageUp>"] = actions.preview_scrolling_up,
						["<PageDown>"] = actions.preview_scrolling_down,
						["<C-u>"] = actions.results_scrolling_up,
						["<C-d>"] = actions.results_scrolling_down,
						["?"] = actions.which_key,
					},
				},
			},
			extensions = {
				-- fzf = {
				-- 	fuzzy = true,                    -- false will only do exact matching
				-- 	override_generic_sorter = true,  -- override the generic sorter
				-- 	override_file_sorter = true,     -- override the file sorter
				-- 	case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
				-- }
			},
			preview = true,
		}

		-- require('telescope').load_extension('fzf')
	end,
	dependencies = {
		{"nvim-lua/plenary.nvim"},
		-- {
		-- 	'nvim-telescope/telescope-fzf-native.nvim',
		-- 	build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
		-- },
		{
			"nvim-telescope/telescope-frecency.nvim",
			config = function()
				require("telescope").load_extension "frecency"
			end,
		},
	}
}


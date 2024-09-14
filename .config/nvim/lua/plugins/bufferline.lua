return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()

		local status_ok, bufferline = pcall(require, "bufferline")
		if not status_ok then
			return
		end

		bufferline.setup {
			options = {
				numbers = "none",
				indicator = {
					icon = ' ',
					style = 'icon',
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = {'close'}
				},
				buffer_close_icon = '',
				modified_icon = "●",
				close_icon = "",
				max_prefix_length = 50,
				max_name_length = 50,
				tab_size = 30,
				left_trunc_marker = "",
				right_trunc_marker = "",
				diagnostics = false,
				diagnostics_update_in_insert = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "EXPLORER",
						text_align = "center"
					}
				},
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "thick",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
			},
			highlights = {
				fill = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "StatusLineNC"
					},
				},
				background = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "StatusLine"
					},
				},
				buffer_visible = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "Normal"
					},
				},
				buffer_selected = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "Normal"
					},
					italic = false,
				},
				separator = {
					fg = {
						attribute = "bg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "StatusLine"
					},
				},
				separator_selected = {
					fg = {
						attribute = "fg",
						highlight = "Special"
					},
					bg = {
						attribute = "bg",
						highlight = "Normal"
					},
				},
				separator_visible = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "StatusLineNC"
					},
				},
				close_button = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "StatusLine"
					},
				},
				close_button_selected = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "Normal"
					},
				},
				close_button_visible = {
					fg = {
						attribute = "fg",
						highlight = "Normal"
					},
					bg = {
						attribute = "bg",
						highlight = "Normal"
					},
				},
			},
		}
		end,
	},
}


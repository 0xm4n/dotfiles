return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		config = function ()
		local custom_components = {
			-- Override 'encoding': Don't display if encoding is UTF-8.
			encoding = function()
				local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
				return ret
			end,
			-- fileformat: Don't display if &ff is unix.
			fileformat = function()
				local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
				return ret
			end,
			lsp_context = function()
				if pcall(require, "nvim-navic") then
					local navic = require("nvim-navic")
					if navic.is_available() then
						return navic.get_location() or ''
					end
				end
				return ''
			end
		}

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'sonokai',
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				}
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {'branch', 'diff'},
				lualine_c = {
					custom_components.lsp_context,
				},
				lualine_x = {
					'searchcount',
					'filename',
				},
				lualine_y = {
					custom_components.encoding,
					custom_components.fileformat,
					'filetype',
				},
				lualine_z = {'progress', 'location'}
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filename'},
				lualine_x = {'location'},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		}
		end,
	},
}


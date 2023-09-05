package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?.lua;" .. package.path

require("core.options")
require("core.lazy")
require("core.keymaps")

require("plugins.bufferline")
require("plugins.cscope")
require("plugins.dap")
require("plugins.gitsigns")
require("plugins.lspzero")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.misc")
require("plugins.nvimtree")
require("plugins.telescope")
require("plugins.themes")
require("plugins.toggleterm")
require("plugins.treesitter")

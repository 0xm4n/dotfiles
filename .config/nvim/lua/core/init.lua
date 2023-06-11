package.path = vim.fn.stdpath("config") .. "/lua/plugins/configs/?.lua;" .. package.path

require("core.options")
require("core.keymaps")
require("core.plugins")

require("plugins.bufferline")
require("plugins.cscope")
require("plugins.dap")
require("plugins.gitsigns")
require("plugins.lspzero")
require("plugins.lualine")
require("plugins.misc")
require("plugins.nvimtree")
require("plugins.telescope")
require("plugins.themes")
require("plugins.toggleterm")
require("plugins.treesitter")

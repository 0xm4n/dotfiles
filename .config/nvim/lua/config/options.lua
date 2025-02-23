vim.opt.belloff = "all"			-- Just turn the dang bell off
vim.opt.cindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true		-- highlight the current line
vim.opt.equalalways = true		-- I don't like my windows changing all the time
vim.opt.fileencoding = "utf-8" 		-- the encoding written to a file
vim.opt.fillchars = { eob = "~" }
vim.opt.ignorecase = true		-- ignore case in search patterns
vim.opt.incsearch = true
vim.opt.mouse = "a" 			-- allow the mouse to be used in neovim
vim.opt.number = true			-- set numbered lines
vim.opt.numberwidth = 4 		-- set number column width to 2 {default 4}
vim.opt.pumblend = 17
vim.opt.pumheight = 10			-- pop up menu height
vim.opt.relativenumber = false		-- set relative numbered lines
vim.opt.scrolloff = 8			-- minimal number of screen lines to keep above and below the cursor
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showtabline = 2			-- always show tabs
vim.opt.sidescrolloff = 8 		-- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.signcolumn = "yes" 		-- always show the sign column otherwise it would shift the text each time
vim.opt.smartcase = true		-- smart case
vim.opt.splitbelow = true 		-- force all horizontal splits to go below current window
vim.opt.splitright = true		-- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true 		-- set term gui colors (most terminals support this)
vim.opt.timeout = true
vim.opt.timeoutlen = 800		-- time to wait for a mapped sequence to complete (in milliseconds).
vim.opt.title = true
vim.opt.updatetime = 300		-- faster completion (4000ms default)
vim.opt.wildmode = "longest:full"
vim.opt.wildoptions = "pum"
vim.opt.ruler = false
vim.opt.undofile = true
vim.g.c_syntax_for_h = 1
vim.opt.shell = '/usr/bin/zsh'
vim.opt.swapfile = false 		-- turn off swapfile
vim.opt.equalprg="clang-format"


local opt = vim.opt

opt.belloff = "all"			-- Just turn the dang bell off
opt.cindent = true
opt.colorcolumn = "80"
opt.cursorline = true			-- highlight the current line
opt.equalalways = false			-- I don't like my windows changing all the time
opt.fileencoding = "utf-8" 		-- the encoding written to a file
opt.fillchars = { eob = "~" }
opt.ignorecase = true			-- ignore case in search patterns
opt.incsearch = true
opt.mouse = "a" 			-- allow the mouse to be used in neovim
opt.number = true			-- set numbered lines
opt.numberwidth = 4 			-- set number column width to 2 {default 4}
opt.pumblend = 17
opt.pumheight = 10			-- pop up menu height
opt.relativenumber = true		-- set relative numbered lines
opt.scrolloff = 8			-- minimal number of screen lines to keep above and below the cursor
opt.showcmd = true
opt.showmatch = true
opt.showtabline = 2			-- always show tabs
opt.sidescrolloff = 8 			-- minimal number of screen columns either side of cursor if wrap is `false`
opt.signcolumn = "yes" 			-- always show the sign column otherwise it would shift the text each time
opt.smartcase = true			-- smart case
opt.splitbelow = true 			-- force all horizontal splits to go below current window
opt.splitright = true			-- force all vertical splits to go to the right of current window
opt.termguicolors = true 		-- set term gui colors (most terminals support this)
opt.timeout = true
opt.timeoutlen = 800			-- time to wait for a mapped sequence to complete (in milliseconds).
opt.title = true
opt.updatetime = 300			-- faster completion (4000ms default)
opt.wildmode = "longest:full"
opt.wildoptions = "pum"
opt.ruler = false
opt.undofile = true
                     
vim.cmd [[
let g:c_syntax_for_h = 1
]]

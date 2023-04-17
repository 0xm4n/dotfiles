vim.opt.number = true                           -- set numbered lines
vim.opt.incsearch = true
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case
vim.opt.cindent = true
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.updatetime = 100
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.termguicolors = true 			-- set term gui colors (most terminals support this)
vim.opt.numberwidth = 4 			-- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" 			-- always show the sign column otherwise it would shift the text each time
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.pumheight = 10
vim.cmd [[
let g:c_syntax_for_h = 1
]]

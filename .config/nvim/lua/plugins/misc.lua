-- indent_blankline
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
}

-- Auto close Quickfix
vim.cmd [[
aug QFClose au! au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
]]

-- vim-bookmarks
-- vim.cmd [[
-- let g:bookmark_save_per_working_dir = 1
-- let g:bookmark_auto_save = 1
-- ]]

-- Undotree
vim.cmd [[
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
]]

-- Fidget
require"fidget".setup{}

-- Copilot
vim.cmd [[
let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'c': v:true,
      \ 'python': v:true,
      \ 'lua': v:true,
      \ }
]]

-- Vista
vim.cmd [[
let g:vista_default_executive = 'nvim_lsp'
let g:vista_sidebar_width = 50
let g:vista_echo_cursor = 0
let g:vista_disable_statusline = 1
let g:vista#renderer#enable_icon = 0
let g:vista_blink = [0, 0]
]]
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		local is_only_one_win = vim.fn.winnr("$") == 1
		local is_vista_open = vim.fn["vista#sidebar#IsOpen"]() == 1

		if is_only_one_win and is_vista_open then
			vim.cmd("silent! q!") end end,
})

-- Tmux Navigator
vim.cmd [[
let g:tmux_navigator_no_mappings = 1
]]

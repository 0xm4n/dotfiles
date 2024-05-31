-- indent_blankline
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = false,
}
vim.g.indent_blankline_char = '¦'
vim.g.indent_blankline_char_blankline = ' '
vim.g.indent_blankline_show_first_indent_level = false


-- Auto close Quickfix
vim.cmd [[
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix" | q | endif
aug END
]]

-- Auto close noname buffer
vim.cmd [[
aug NoNameClose
  au!
  au WinEnter * if winnr('$') == 1 && bufname() == "" && &buftype == "quickfix" | q | endif
aug END
]]

-- Remove colorcolumn on quickfix window
vim.cmd [[
au FileType qf setlocal colorcolumn=
]]

-- Hidden no_name buffer
vim.cmd [[
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
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

-- quickfix
require('bqf').setup({
	preview = {
		auto_preview = false,
		win_height = 999,
	}
})

-- highlight trailing whitespace
vim.cmd [[
let g:better_whitespace_ctermcolor='darkgrey'
let g:better_whitespace_guicolor='darkgrey'
let g:strip_whitespace_on_save=0
let g:strip_whitelines_at_eof=0
]]

-- osc52 passthrough tmux
require('osc52').setup {
	silent = true,
	tmux_passthrough = true, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
}

function copy()
  if vim.v.event.operator == 'y' then
    require('osc52').copy_visual()
  end
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

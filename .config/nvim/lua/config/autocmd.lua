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

-- Auto close nvimtree
vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})

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

vim.lsp.set_log_level("off")
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false
	}
)

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

vim.cmd [[
let g:tmux_navigator_no_mappings = 1
]]


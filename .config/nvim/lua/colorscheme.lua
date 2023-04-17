-- local colorscheme = "vscode"
local colorscheme = "sonokai"

vim.cmd [[
" let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

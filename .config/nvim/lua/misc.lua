-- require("symbols-outline").setup()

-- move-nvim
local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<M-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<M-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<M-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<M-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<M-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<M-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<M-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<M-l>', ':MoveHBlock(1)<CR>', opts)

-- ufo
-- vim.o.foldcolumn = '1' -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- require('ufo').setup({
--     provider_selector = function(bufnr, filetype, buftype)
--         return {'treesitter', 'indent'}
--     end
-- })

-- indent_blankline
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
}

-- Auto close Quickfix
vim.cmd [[
aug QFClose
au!
au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
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

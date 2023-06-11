-- require("symbols-outline").setup()

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

require"fidget".setup{}

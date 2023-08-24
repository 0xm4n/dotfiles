-- Shorten funciton name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window
keymap("n", "<C-Left>", "<cmd>lua require('resize').ResizeLeft()<CR>", opts)
keymap("n", "<C-Right>", "<cmd>lua require('resize').ResizeRight()<CR>", opts)
keymap("n", "<C-Up>", "<cmd>lua require('resize').ResizeUp()<CR>", opts)
keymap("n", "<C-Down>", "<cmd>lua require('resize').ResizeDown()<CR>", opts)

-- Esc to clear highlight
keymap("n", "<Esc>", "<cmd>noh <CR>", opts)

-- Jump to start & end of line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- Quick Save
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Inline motion
keymap('x', 'il', '^o$h', opts)
keymap('o', 'il', ':normal vil<CR>',opts)

-- Keep next in the middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap('n', 'J', 'mzJ`z', opts)

-- Center on page up/down
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- Subtitute
keymap("n", "<leader>s", "<cmd>lua require('substitute').operator()<cr>", opts)
keymap("n", "<leader>ss", "<cmd>lua require('substitute').line()<cr>", opts)
keymap("n", "<leader>S", "<cmd>lua require('substitute').eol()<cr>", opts)
keymap("x", "<leader>s", "<cmd>lua require('substitute').visual()<cr>", opts)

-- indent code block
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Buffer
keymap('n', '<leader>bd','<cmd>bd<CR>', opts)
keymap('n', '<leader>bn','<cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<leader>bp','<cmd>BufferLineCyclePrev<CR>', opts)
keymap('n', '<leader>bc','<cmd>BufferLinePickClose<CR>', opts)
keymap('n', '<leader>bmn','<cmd>BufferLineMoveNext<CR>', opts)
keymap('n', '<leader>bmp','<cmd>BufferLineMovePrev<CR>', opts)

-- Tab
keymap('n', '<leader>tn','<cmd>tabnext<CR>', opts)
keymap('n', '<leader>tp','<cmd>tabprevious<CR>', opts)
keymap('n', '<leader>tc','<cmd>tabclose<CR>', opts)

-- Telescope Find
keymap('n', '<leader>ff',  "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap('n', '<leader>fg',  "<cmd>lua require('telescope.builtin').live_grep({only_sort_text = true})<cr>", opts)
keymap('n', '<leader>fb',  "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap('n', '<leader>fh',  "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap('n', '<leader>fd',  "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
keymap('n', '<leader>ft',  "<cmd>lua require('telescope.builtin').current_buffer_tags()<cr>", opts)
keymap('n', '<leader>fq',  "<cmd>lua require('telescope.builtin').quickfix()<cr>", opts)
keymap('n', '<leader>fo',  "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
keymap('n', '<leader>fr',  "<cmd>lua require('telescope.builtin').resume()<cr>", opts)
keymap('n', '<leader>fj',  "<cmd>lua require('telescope.builtin').jumplist()<cr>", opts)
keymap('n', ',fg',  "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)
keymap('n', ',fh',':execute \'Telescope help_tags default_text=\' . expand(\'<cword>\')<CR>', opts)

-- Telescope LSP
keymap('n', '<leader>ls',  "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", opts)
keymap('n', '<leader>ld',  "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", {silent = true})
keymap('n', '<leader>li',  "<cmd> Telescope lsp_implementation<CR>", {silent = true})
keymap('n', '<leader>lr',  "<cmd> Telescope lsp_references<CR>", {silent = true})
keymap('n', '<leader>lh',"<cmd>ClangdSwitchSourceHeader<CR>", opts)
keymap('n', ',ls',':execute \'Telescope lsp_dynamic_workspace_symbols default_text=\' . expand(\'<cword>\')<CR>', opts)
keymap('n', ',ld',  "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
keymap('n', ',lr',  "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
-- keymap('n', ',goc',  "<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<cr>", opts)
-- keymap('n', ',gic',  "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<cr>", opts)

-- Telescope Git
keymap('n', '<leader>gs',  "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
keymap('n', '<leader>gc',  "<cmd>lua require('telescope.builtin').git_commits()<cr>", opts)
keymap('n', '<leader>gb',  "<cmd>lua require('telescope.builtin').git_branches()<cr>", opts)
keymap('n', '<leader>gdo',  "<cmd>DiffviewOpen<cr>", opts)
keymap('n', '<leader>gdc',  "<cmd>DiffviewClose<cr>", opts)
keymap('n', '<leader>gdr',  "<cmd>DiffviewRefresh<cr>", opts)
keymap('n', '<leader>gdf',  "<cmd>DiffviewFileHistory %<cr>", opts)

-- gitsigns
-- keymap('n', '<leader>gq', '<cmd>lua require"gitsigns".setqflist()<CR>', opts)
-- keymap('n', '<leader>ga', '<cmd>lua require"gitsigns".attach()<CR>', opts)
-- vim.keymap.set('n', '<leader>gg', "<cmd>lua require('gitsigns').change_base('acbfe1e4b4')<CR>", opts)

-- Open
keymap("n", "<leader>nf", "<cmd> NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>nn", "<cmd> NvimTreeToggle<CR>", opts)
keymap("n", "<leader>oe", '<cmd>lua vim.diagnostic.open_float({scope="line"})<CR>', opts)

-- Vista
keymap("n", "<F8>", '<cmd>Vista!!<CR>', opts)

-- cscope
csearch = function(operation, default_symbol)
	vim.cmd(":cs find " .. operation .. " " .. default_symbol)
	vim.cmd("copen")
end
keymap("n", "<leader>cs", [[<cmd>lua csearch('s', vim.fn.expand("<cword>"))<cr>]], opts)
keymap("n", "<leader>cg", [[<cmd>lua csearch('g', vim.fn.expand("<cword>"))<cr>]], opts)
keymap("n", "<leader>cc", [[<cmd>lua csearch('c', vim.fn.expand("<cword>"))<cr>]], opts)
keymap("n", "<leader>ct", [[<cmd>lua csearch('t', vim.fn.expand("<cword>"))<cr>]], opts)
keymap("n", "<leader>ce", [[<cmd>lua csearch('e', vim.fn.expand("<cword>"))<cr>]], opts)
keymap("n", "<leader>cf", [[<cmd>lua csearch('f', vim.fn.expand("<cfile>"))<cr>]], opts)
keymap("n", "<leader>cd", [[<cmd>lua csearch('d', vim.fn.expand("<cword>"))<cr>]], opts)
-- keymap("n", "<leader>ci", [[<cmd>lua csearch('i', vim.fn.expand("<cfile>"))<cr>]], opts)
-- keymap("n", "<leader>ca", [[<cmd>lua csearch('a', vim.fn.expand("<cword>"))<cr>]], opts)

-- quickfix
keymap("n", "<leader>co", ':colder<CR>', opts)
keymap("n", "<leader>ci", ':cnewer<CR>', opts)
keymap("n", "<leader>cn", ':cnext<CR>', opts)
keymap("n", "<leader>cp", ':cp<CR>', opts)

-- maximizer
keymap('n', '<C-w>z', '<cmd> MaximizerToggle<CR>', opts)
keymap('v', '<C-w>z', '<cmd> MaximizerToggle<CR>', opts)

-- source
keymap('n', '<leader>sv', ':source $MYVIMRC<CR>', opts)

-- dap
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dc", ":lua require'dap'.close()<CR> :lua require'dapui'.close()<CR>", opts)
keymap('n', '<leader>dv',  "<cmd>lua require('telescope').extensions.dap.variables({})<CR>", opts)
keymap('n', '<leader>df',  "<cmd>lua require('telescope').extensions.dap.frames({})<CR>", opts)
keymap('n', '<leader>dl',  "<cmd>lua require('telescope').extensions.dap.list_breakpoints({})<CR>", opts)

-- tmux navigator
keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<cr>", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<cr>", opts)
keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>", opts)

-- reset gi
keymap('n', 'gi', 'gi', opts)

-- hlslens
-- keymap('n', 'n', [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
-- keymap('n', 'N', [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
-- keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
-- keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
-- keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

-- diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- highlight TODO
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

-- Quick copy paste into system clipboard
vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {expr = true})
vim.keymap.set('x', '<leader>y', require('osc52').copy_visual)

-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
-- vim.keymap.set('', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', '<leader>fw', function() hop.hint_words() end, {remap=true})
vim.keymap.set('', '<leader>fl', function() hop.hint_lines_skip_whitespace() end, {remap=true})

-- LSP
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-S-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, opts)

-- UndoTree
-- vim.keymap.set('n', '<F5>', vim.cmd.UndotreeToggle)


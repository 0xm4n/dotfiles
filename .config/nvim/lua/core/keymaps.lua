local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten funciton name
local keymap = vim.api.nvim_set_keymap

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
-- keymap("n", "<C-Left>", "<C-w>>", opts)
-- keymap("n", "<C-Right>", "<C-w><", opts)
-- keymap("n", "<C-Up>", "<C-w>+", opts)
-- keymap("n", "<C-Down>", "<C-w>-", opts)
keymap("n", "<C-Left>", "<CMD>vertical resize +5<CR>", opts)
keymap("n", "<C-Up>", "<CMD>resize +5<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical resize -5<CR>", opts)
keymap("n", "<C-Down>", "<CMD>resize -5<CR>", opts)


keymap("n", "<Esc>", "<cmd>noh <CR>", opts)

-- Jump to start & end of line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- Quick Save
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)
keymap("n", "<C-c>", ":q<CR>", opts)

-- Quick copy paste into system clipboard
vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>yy', '<leader>c_', {remap = true})
vim.keymap.set('x', '<leader>y', require('osc52').copy_visual)
-- vim.keymap.set('x', '<leader>y', ":call system('nc -N localhost 8377', @0)<CR>")
-- vim.keymap.set('n', '<leader>y', ":call system('nc -N localhost 8377', @0)<CR>")

-- Keep next in the middle
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
vim.keymap.set('n', 'J', 'mzJ`z', opts)

-- Split
keymap("n", "<leader>-", ":sp<CR>", opts)
keymap("n", "<leader>|", ":vsp<CR>", opts)

-- subtitute.nvim
keymap("n", "<leader>s", "<cmd>lua require('substitute').operator()<cr>", term_opts)
keymap("n", "<leader>ss", "<cmd>lua require('substitute').line()<cr>", term_opts)
keymap("n", "<leader>S", "<cmd>lua require('substitute').eol()<cr>", term_opts)
keymap("x", "<leader>s", "<cmd>lua require('substitute').visual()<cr>", term_opts)

-- indent code block
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- LSP
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-S-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, opts)

-- Buffer
vim.keymap.set('n', '<leader>bd','<cmd>bd<CR>', opts)
vim.keymap.set('n', '<leader>bn','<cmd>BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<leader>bp','<cmd>BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<leader>bc','<cmd>BufferLinePickClose<CR>', opts)
vim.keymap.set('n', '<leader>bmn','<cmd>BufferLineMoveNext<CR>', opts)
vim.keymap.set('n', '<leader>bmp','<cmd>BufferLineMovePrev<CR>', opts)

-- Telescope
vim.keymap.set('n', '<leader>ff',  "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.keymap.set('n', '<leader>fg',  "<cmd>lua require('telescope.builtin').live_grep({only_sort_text = true})<cr>", opts)
vim.keymap.set('n', '<leader>fb',  "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
vim.keymap.set('n', '<leader>fh',  "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
vim.keymap.set('n', '<leader>fs',  "<cmd>lua require('telescope.builtin').git_status()<cr>", opts)
vim.keymap.set('n', '<leader>fd',  "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", opts)
vim.keymap.set('n', '<leader>ft',  "<cmd>lua require('telescope.builtin').current_buffer_tags()<cr>", opts)
vim.keymap.set('n', '<leader>fq',  "<cmd>lua require('telescope.builtin').quickfix()<cr>", opts)
vim.keymap.set('n', '<leader>fo',  "<cmd>lua require('telescope.builtin').oldfiles()<cr>", opts)
-- vim.keymap.set('n', ',fg',':execute \'Telescope grep_string default_text=\' . expand(\'<cword>\')<CR>', opts)
vim.keymap.set('n', ',fg',  "<cmd>lua require('telescope.builtin').grep_string()<cr>", opts)

-- Telescope LSP
vim.keymap.set('n', '<leader>gs',  "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", opts)
vim.keymap.set('n', '<leader>gd',  "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", {silent = true})
vim.keymap.set('n', '<leader>gi',  "<cmd> Telescope lsp_implementation<CR>", {silent = true})
vim.keymap.set('n', '<leader>gr',  "<cmd> Telescope lsp_references<CR>", {silent = true})
vim.keymap.set('n', '<leader>gh',"<cmd>ClangdSwitchSourceHeader<CR>", opts)
vim.keymap.set('n', ',gs',':execute \'Telescope lsp_dynamic_workspace_symbols default_text=\' . expand(\'<cword>\')<CR>', opts)
vim.keymap.set('n', ',gd',  "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
vim.keymap.set('n', ',gr',  "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
vim.keymap.set('n', ',goc',  "<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<cr>", opts)
vim.keymap.set('n', ',gic',  "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<cr>", opts)

-- Open
keymap("n", "<leader>nf", "<cmd> NvimTreeFindFile<CR>", opts)
keymap("n", "<leader>nn", "<cmd> NvimTreeToggle<CR>", opts)
keymap("n", "<leader>oe", '<cmd>lua vim.diagnostic.open_float({scope="line"})<CR>', opts)

keymap("n", "<F8>", ':TagbarToggle<CR>', opts)

vim.keymap.set('n', '<F5>', vim.cmd.UndotreeToggle)

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
keymap("n", "<leader>ci", [[<cmd>lua csearch('i', vim.fn.expand("<cfile>"))<cr>]], opts)
keymap("n", "<leader>cd", [[<cmd>lua csearch('d', vim.fn.expand("<cword>"))<cr>]], opts)
keymap("n", "<leader>ca", [[<cmd>lua csearch('a', vim.fn.expand("<cword>"))<cr>]], opts)

-- quickfix
vim.keymap.set("n", "<leader>col", ':colder<CR>', opts)
vim.keymap.set("n", "<leader>cnew", ':cnewer<CR>', opts)
vim.keymap.set("n", "<leader>cn", ':cnext<CR>', opts)
vim.keymap.set("n", "<leader>cp", ':cp<CR>', opts)

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

local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
vim.keymap.set('', '<leader>fw', function() hop.hint_words() end, {remap=true})
vim.keymap.set('', '<leader>fl', function() hop.hint_lines_skip_whitespace() end, {remap=true})

vim.keymap.set('n', '<C-w>z', '<cmd> WindowsMaximize<CR>')
vim.keymap.set('n', '<C-w>_', '<cmd> WindowsMaximizeVertically<CR>')
vim.keymap.set('n', '<C-w>|', '<cmd> WindowsMaximizeHorizontally<CR>')
vim.keymap.set('n', '<C-w>=', '<cmd> WindowsEqualize<CR>')

-- gitsigns
vim.keymap.set('n', '<leader>gq', '<cmd>lua require"gitsigns".setqflist()<CR>', opts)
vim.keymap.set('n', '<leader>ga', '<cmd>lua require"gitsigns".attach()<CR>', opts)

-- source
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>', opts)

-- dap
vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require'dapui'.close()<CR>")

vim.keymap.set('n', '<leader>dv',  "<cmd>lua require('telescope').extensions.dap.variables({})<CR>", opts)
vim.keymap.set('n', '<leader>df',  "<cmd>lua require('telescope').extensions.dap.frames({})<CR>", opts)
vim.keymap.set('n', '<leader>dl',  "<cmd>lua require('telescope').extensions.dap.list_breakpoints({})<CR>", opts)

-- diagnostic
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

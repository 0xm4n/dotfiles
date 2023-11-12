local cmp = require 'cmp'
local lsp_zero = require('lsp-zero')
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format()

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = {
			scrollbar = false,
		},
	},
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
		-- ['<Tab>'] = cmp_action.luasnip_supertab(),
		-- ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
	},
	-- formatting = {
	-- 	-- fields = {'abbr', 'kind', 'menu'},
	-- 	fields = {'abbr', 'kind'},
	-- 	-- format = require('lspkind').cmp_format({
	-- 	-- 	mode = 'symbol_text',
	-- 	-- 	maxwidth = 60,
	-- 	-- 	ellipsis_char = '...',
	-- 	-- }),
	-- },
	formatting = cmp_format,
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'nvim_lua' },
		{ name = 'path' },
	},
})

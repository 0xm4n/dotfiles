return {
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = true
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
    			"williamboman/mason-lspconfig.nvim",
		},
		config = function ()
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "clangd" },
				automatic_installation = true,
			}
			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
					'--clang-tidy',
					'--background-index',
					'--all-scopes-completion',
					'--completion-style=detailed',
					'--fallback-style=webkit',
					'--cross-file-rename',
					'--pch-storage=memory',
					'--malloc-trim',
					'--header-insertion=never',
				},
				config = function ()
					vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
						vim.lsp.diagnostic.on_publish_diagnostics, {
							virtual_text = false
						}
					)
				end,
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
					vim.keymap.set("n", "gi", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "List Incoming Calls" })
					-- vim.keymap.set("n", "gO", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "List Outgoing Calls" })
					-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Symbol References" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to Next Diagnostic" })
					vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, desc = "Open Diagnostic Float" })
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to Previous Diagnostic" })
				end,

			})
		end
	},
	{
		"p00f/clangd_extensions.nvim",
		config = function()
			require("clangd_extensions").setup({})
		end,
	},

	-- {
	-- 	"ray-x/navigator.lua",
	-- 	after = 'mason.nvim',
	-- 	dependencies = {'ray-x/guihua.lua', build = 'cd lua/fzy && make', opt = true},
	-- 	event = "LspAttach",
	-- 	config = function()
	-- 		require'navigator'.setup()
	-- 	end,
	-- },

}

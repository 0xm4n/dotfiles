local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require'lspconfig'.clangd.setup{
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
		'--clang-tidy',
		'--background-index',
		'--all-scopes-completion',
		'--completion-style=detailed',
		'--fallback-style=webkit',
		'--cross-file-rename',
	},
}
-- lsp.skip_server_setup({'clangd'})

lsp.setup()

-- require('clangd_extensions').setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)


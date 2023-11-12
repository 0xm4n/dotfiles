local lsp = require('lsp-zero').preset({})
local lsp_zero = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

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
		'--pch-storage=memory',
		'--malloc-trim',
		'--header-insertion=never',
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

vim.lsp.set_log_level("OFF")


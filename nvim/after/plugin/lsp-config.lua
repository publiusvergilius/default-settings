require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = { 'lua_ls', 'gopls' },
}

local function setup_lsp_diags()
	vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
		underline = true,
	})
end

setup_lsp_diags()

require('lspconfig').lua_ls.setup {}

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { 0, { scope = 'line' } })

require('lspconfig').gopls.setup {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
}

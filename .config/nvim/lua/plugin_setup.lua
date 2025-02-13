require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "jdtls", "vimls", "hydra_lsp", "eslint", "bashls", "lua_ls", "pyright" },
	-- "nginx_language-server"
}



require('telescope').setup {
	defaults = {
		hidden = true,
		path_display = 'filename_first' } }

require('lspconfig').lua_ls.setup {}

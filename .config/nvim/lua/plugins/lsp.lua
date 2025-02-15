vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

return {
	'williamboman/mason.nvim',
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "jdtls", "vimls", "hydra_lsp", "eslint", "bashls", "lua_ls", "pyright" },
				-- "nginx_language-server"
			}
		end,
	},

	'neovim/nvim-lspconfig',
	'mfussenegger/nvim-jdtls',
}

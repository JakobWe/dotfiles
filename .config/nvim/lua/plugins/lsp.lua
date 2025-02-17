vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("i", "<leader>ll", vim.lsp.buf.completion)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)



-- Don't forget to install shellcheck!
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'sh',
	callback = function()
		vim.lsp.start({
			name = 'bash-language-server',
			cmd = { 'bash-language-server', 'start' },
		})
	end,
})


return {
	'williamboman/mason.nvim',
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = { "jdtls", "vimls", "hydra_lsp", "eslint", "bashls", "lua_ls", "pyright", "bashls" },
				-- "nginx_language-server"
			}
		end,
	},

	{
		'neovim/nvim-lspconfig',
		config = function()
			require('lspconfig').lua_ls.setup {}
		end,
	},
	'mfussenegger/nvim-jdtls',
}

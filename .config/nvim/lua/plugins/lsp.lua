vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)


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

	'neovim/nvim-lspconfig',
	'mfussenegger/nvim-jdtls',
}

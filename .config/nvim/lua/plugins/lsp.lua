vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("i", "<leader>ll", vim.lsp.buf.completion)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)




vim.lsp.handlers["textDocument/completion"] = function(_, result, ctx, config)
  --print(vim.inspect(result))  -- This will show the completion result from the server
  vim.cmd(":!echo " .. vim.inspect(result) ..  "> ttttttt.txt")  -- This will show the completion result from the server
end


vim.keymap.set("i", "olla", "v:lua.vim.lsp.buf.completion()")

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
			require('lspconfig').jdtls.setup {}
		end,
	},
	'mfussenegger/nvim-jdtls',
}

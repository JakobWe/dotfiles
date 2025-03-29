vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
--vim.keymap.set("i", "<leader>ll", vim.lsp.buf.completion.get())
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
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
}

vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("i", "<leader>ll", vim.lsp.buf.completion)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover)




--vim.lsp.handlers["textDocument/completion"] = function(_, result, ctx, config)
--print(vim.inspect(result))  -- This will show the completion result from the server
--  vim.cmd(":!echo " .. vim.inspect(result) ..  "> ttttttt.txt")  -- This will show the completion result from the server
--end


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
		end,
	},
	'mfussenegger/nvim-jdtls',
	'hrsh7th/nvim-cmp',
	{
		'hrsh7th/cmp-nvim-lsp',
		config = function()
			local cmp = require('cmp')

			cmp.setup {
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'vsnip' },
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- because we are using the vsnip cmp plugin
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<a-h>'] = cmp.mapping.scroll_docs(-4),
					['<a-l>'] = cmp.mapping.scroll_docs(4),
					--['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},

					['<a-j>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<a-k>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { 'i', 's' }),
				}),
			}
		end,
	},


	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-vsnip',
	'hrsh7th/vim-vsnip',
}

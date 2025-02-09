-- Lsp
vim.keymap.set('n', '<leader>fu', 
	function()
		require('telescope.builtin').lsp_references({
			jump_type = 'tab',
			reuse_win = 'true'
		})
	end)

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)



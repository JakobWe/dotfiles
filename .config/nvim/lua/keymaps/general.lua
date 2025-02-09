vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>n", ":edit ")


vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")

-- easymotion
vim.keymap.set('n', 's', '<Plug>(easymotion-overwin-f)')
vim.keymap.set('n', '<leader>l', '<Plug>(easymotion-overwin-line)')
vim.keymap.set('n', '<leader>w', '<Plug>(easymotion-overwin-w)')




require("nvim-treesitter.configs").setup {
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "v",
			node_decremental = "V",
		},
	}, 
}







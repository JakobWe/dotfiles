




return {
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate',
config = function()

require("nvim-treesitter.configs").setup {
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "v",
			node_decremental = "V",
		},
	}, 
}

end



},
	'easymotion/vim-easymotion',
}

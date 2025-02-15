return {
	'wbthomason/packer.nvim',
	'neovim/nvim-lspconfig',
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local telescope = require('telescope')
			telescope.setup {
				pickers = {
					find_files = {
						hidden = true,
						path_display = {
							"filename_first"
						},
					},
				}
			}
		end,
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'mfussenegger/nvim-jdtls',

	{ 'ibhagwan/fzf-lua' },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },


	'easymotion/vim-easymotion',

	-- themes

	'sainnhe/everforest',
	'xero/miasma.nvim',
	'zenbones-theme/zenbones.nvim',
	'rose-pine/neovim',
	'ellisonleao/gruvbox.nvim',
	'qaptoR-nvim/chocolatier.nvim',
	'pappasam/papercolor-theme-slim',

}

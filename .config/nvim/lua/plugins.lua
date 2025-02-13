return  {
	'wbthomason/packer.nvim',
	'neovim/nvim-lspconfig',
	{
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
	},
{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
    'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
		'mfussenegger/nvim-jdtls',
	 
		'ibhagwan/fzf-lua',
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	
	 
		'rose-pine/neovim',

  'qaptoR-nvim/chocolatier.nvim',

 'pappasam/papercolor-theme-slim',

 'ellisonleao/gruvbox.nvim',
	 
		'easymotion/vim-easymotion',
	}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use {
		'nvim-telescope/telescope.nvim',
  	requires = { {'nvim-lua/plenary.nvim'} }
	} 

	require('telescope').setup{
		defaults = {
			path_display={"filename_first"}
		}
	}

 use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	} 
	
	use {
		'mfussenegger/nvim-jdtls'
	}

	use {
		'ibhagwan/fzf-lua'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	use {
		'rose-pine/neovim',
		run = function()
			vim.cmd("colorscheme rose-pine")
		end
	}
use { "qaptoR-nvim/chocolatier.nvim" }

use {"pappasam/papercolor-theme-slim"}

use {"ellisonleao/gruvbox.nvim"}
	use {
		'easymotion/vim-easymotion'
	}


end)




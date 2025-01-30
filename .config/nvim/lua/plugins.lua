return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'


use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
}

use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
} 

require('telescope').setup{
    defaults = {
	path_display={"truncate"}
    }
}

-- use {
--    "williamboman/mason.nvim",
--    "williamboman/mason-lspconfig.nvim",
--    "neovim/nvim-lspconfig",
--} 

use {
  'mfussenegger/nvim-jdtls'
}

--require("mason").setup()
--require("mason-lspconfig").setup()

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



end)




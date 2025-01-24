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

end)




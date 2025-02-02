vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>n", ":edit ")


--telescope
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtinvim.keymap.set("n", "<leader>y", '"0y').find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>")
--vim.keymap.set('n', '<leader>fp', require('fzf-lua').files( { cmd = "rg -g '*pom.xml'"}))

vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>')


vim.keymap.set('n', '<leader>fp', 
  function()
    require('fzf-lua').files({
	    cmd = "rg --files -g 'pom.xml' ~/",
    })
  end)



-- easymotion
vim.keymap.set('n', 's', '<Plug>(easymotion-overwin-f)')
vim.keymap.set('n', '<leader>l', '<Plug>(easymotion-overwin-line)')
vim.keymap.set('n', '<leader>w', '<Plug>(easymotion-overwin-w)')

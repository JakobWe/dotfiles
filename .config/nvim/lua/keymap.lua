vim.keymap.set("n", " ", "<NOP>")

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>b", ":Ex<CR>")
vim.keymap.set("n", "<leader>n", ":edit ")

local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>")


vim.api.nvim_set_keymap('n', '<leader>fn', 
  "<cmd>lua require('telescope.builtin').find_files({fuzzy = false})<CR>", 
  { noremap = true, silent = true })

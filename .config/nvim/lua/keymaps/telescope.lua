local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg',  require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
--vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>")
vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>')



local change_to_files_directory = function(prompt_bufnr)
	local actions_state = require("telescope.actions.state")
	local actions = require("telescope.actions")

	local selected_entry = actions_state.get_selected_entry()
	local path = actions_state.get_selected_entry().path
	local regex = "^(.*/)"
	local result = string.match(path, regex)
  vim.cmd(':cd ' .. result)
	actions.close(prompt_bufnr)
end


vim.keymap.set('n', '<leader>fp',
	function()
		require("telescope.builtin").find_files({
			search_file = 'pom.xml',
			cwd = '~',
			attach_mappings = function(_, map)
				map("n", "<cr>", change_to_files_directory)
				map("i", "<cr>", change_to_files_directory)
				return true
			end,
		})
	end)




vim.keymap.set('n', '<leader>fyy',
  function()
    require('telescope.builtin').live_grep({
			vimgrep_arguments  = {
      "rg",
      "-L",
			"-z",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    }
	 })
  end)





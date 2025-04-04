return {
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
				},
			}
			telescope.load_extension('fzf')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>fu',
				function()
					builtin.lsp_references({
						jump_type = 'tab',
						reuse_win = 'true'
					})
				end)

			-- stolen from kickstart
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
			vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
			vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set('n', '<leader>f<leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })


			local change_to_files_directory = function(prompt_bufnr)
				local actions_state = require('telescope.actions.state')
				local actions = require('telescope.actions')

				local selected_entry = actions_state.get_selected_entry()
				local path = actions_state.get_selected_entry().path
				local regex = "^(.*/)"
				local result = string.match(path, regex)

				actions.close(prompt_bufnr)
				vim.cmd(':cd ' .. result)
				vim.cmd(':Ex ' .. result)
				return true
			end

			vim.keymap.set('n', '<leader>f',
				function()
					vim.cmd("!rm -rf " .. vim.fn.expand("~/.local/state/nvim/mycache/"))
				end)

			vim.keymap.set('n', '<leader>fp',
				function()
					builtin.find_files({
						--search_file = 'pom.xml',
						find_command = { "bash", vim.fn.expand("~/.vim/scripts/pomxml_cache.sh") },
						path_display = {
							--"filename_first"
							"smart"
						},
						attach_mappings = function(_, map)
							map("n", "<cr>", change_to_files_directory)
							map("i", "<cr>", change_to_files_directory)
							return true
						end,
					})
				end)

			vim.keymap.set('n', '<leader>fyy',
				function()
					telescope.builtin.live_grep({
						vimgrep_arguments = {
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
		end,
	},


	{
		'ibhagwan/fzf-lua',
		config = function()
			--vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>")
			local change_to_files_directory = function(prompt_bufnr)
				local actions_state = require('telescope.actions.state')
				local actions = require('telescope.actions')

				local selected_entry = actions_state.get_selected_entry()
				local path = actions_state.get_selected_entry().path
				local regex = "^(.*/)"
				local result = string.match(path, regex)

				print(result)
				actions.close(prompt_bufnr)
				vim.cmd(':cd ' .. result)
				vim.cmd(':Ex ' .. result)
				return true
			end

			vim.keymap.set('n', '<leader>f1',
				function()
					require('fzf-lua').files({
						cwd = '~',
						--cmd = 'cat test.txt',
						cmd = vim.fn.expand("~/.vim/scripts/pomxml_cache.sh"),
						attach_mappings = function(_, map)
							map("n", "<cr>", change_to_files_directory)
							map("i", "<cr>", change_to_files_directory)
							return true
						end,
					})
				end)
		end,

	},
}

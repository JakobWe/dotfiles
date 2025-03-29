return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			-- REQUIRED
			local harpoon = require("harpoon")
			harpoon:setup()
			-- REQUIRED

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

			-- Toggle previous & next buffers stored within Harpoon list
			--vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
			--vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
			vim.keymap.set("n", "<C-k>", function() harpoon:list():prev() end)
			vim.keymap.set("n", "<C-j>", function() harpoon:list():next() end)
		end,


	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require("nvim-treesitter.configs").setup {
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V",
					},
				},


				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "java" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = false,

				-- List of parsers to ignore installing (or "all")
				ignore_install = { "javascript" },

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,

					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			}
		end
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
		end,
	},

	{ 'tpope/vim-surround' },
	{ 'tpope/vim-commentary' },
}

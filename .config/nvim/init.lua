vim.cmd('source ~/.vimrc')

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")

print("Hello World")

require('config.lazy')

require('colors')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.lsp.enable({'jdtls', 'bash-language-server', 'lua_ls'})

vim.diagnostic.config({
  virtual_lines = true
})

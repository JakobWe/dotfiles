vim.cmd('source ~/.vimrc')

print("Hello World")

require('keymaps')
require('config.lazy')

require('plugin_setup')

require('treesitterconf')
require('colors')

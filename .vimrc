nnoremap <SPACE> <Nop>
let mapleader = " "

"Swap Escape and Caps lock:
"on linux: setxkbmap -option caps:swapescape

"Key repeat on mac os:
"defaults write -g ApplePressAndHoldEnabled -bool false

syntax on
filetype on
set relativenumber
set number
set nowrapscan
set scrolloff=10
set scroll=5
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase
"set signcolumn=yes
set updatetime=250

set completeopt=menu,menuone,noselect


"Keybindings that make some common keys easier to reach on a qwertz keyboard
map ä /
map ö ;
map Ö ,


nmap <leader><c-s> :w<CR>
"imap <leader><c-s> <Esc>:w<CR>a
vmap <leader><c-s> <Esc>:w<CR>a

nmap <Leader><c-w> <Esc>:q<CR>
vmap <Leader><c-w> <Esc>:q<CR>

nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>


"Easymotion setup for vim, in nvim it is done by packer
if !has('nvim')
  call plug#begin()
  Plug 'easymotion/vim-easymotion' 
  call plug#end()

  nmap s <Plug>(easymotion-overwin-f)
  let g:EasyMotion_smartcase = 1
  nmap <Leader>L <Plug>(easymotion-overwin-line)
  nmap <Leader>w <Plug>(easymotion-overwin-w)
endif

"System clipboard
if has('mac')
  map <Leader>y "*y
  map <Leader>p "*p
elseif has('unix')
  map <Leader>y "+y
  map <Leader>p "+p
endif


nmap <leader>dk :!/bin/bash -c "~/.vim/scripts/docker_purge.sh" <CR><CR>

hi Normal guibg=NONE ctermbg=NONE



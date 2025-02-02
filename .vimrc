nnoremap <SPACE> <Nop>
let mapleader = " "

syntax on
filetype on
set relativenumber
set scrolloff=7
set scroll=5

set ignorecase
set smartcase
"set signcolumn=yes
set updatetime=250

nmap . ;

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
  nmap <Leader>y "*y
  vmap <Leader>y "*y
  nmap <Leader>p "*p
  vmap <Leader>p "*p
elseif has('unix')
  nmap <Leader>y "+y
  vmap <Leader>y "+y
  nmap <Leader>p "+p
  vmap <Leader>p "+p
endif


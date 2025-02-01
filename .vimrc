syntax on
filetype on
set relativenumber
set scrolloff=7
set scroll=5


let mapleader = " "

call plug#begin()

Plug 'easymotion/vim-easymotion'

call plug#end()

nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

nmap <Leader>L <Plug>(easymotion-overwin-line)
nmap <Leader>w <Plug>(easymotion-overwin-w)


nmap <silent> m <C-e>
nmap <silent> , <C-y>

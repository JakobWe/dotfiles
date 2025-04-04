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
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
"set signcolumn=yes
set updatetime=250

set completeopt=menu,menuone,noselect


"Keybindings that make some common keys easier to reach on a qwertz keyboard
" nnoremap ; ,
" nnoremap , ;
map - /
map ö ;
map Ö :

imap jj <Esc>

nmap <leader><c-s> :w<CR>
"imap <leader><c-s> <Esc>:w<CR>a
vmap <leader><c-s> <Esc>:w<CR>a

nmap <Leader><c-w> <Esc>:q<CR>
vmap <Leader><c-w> <Esc>:q<CR>

nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>

"System clipboard
if has('mac')
  " map <Leader>y "*y
  " map <Leader>p "*p
  map <Leader> "*
elseif has('unix')
  " map <Leader>y "+y
  " map <Leader>p "+p
  map <Leader> "+
endif

nmap <a-p> "0p
vmap <a-p> "0p
nmap <leader>r :reg<CR>
vmap <leader>r :reg<CR>

nmap <a-k> { 
nmap <a-j> }

nmap <a--> [m
nmap <a-+> ]m


nmap <leader>dk :!/bin/bash -c "~/.vim/scripts/docker_purge.sh" <CR><CR>

nmap <leader>e :Ex<CR>

hi Normal guibg=NONE ctermbg=NONE

if has("persistent_undo")
 if has('nvim')
   let target_path = expand('~/.undodir/nvim')
 else
   let target_path = expand('~/.undodir/vim')
 endif

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

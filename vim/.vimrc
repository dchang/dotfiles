syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
call plug#end()

colorscheme gruvbox
set background=dark

let g:vimwiki_list = [{'path': '~/Documents/wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:rustfmt_autosave = 1

let mapleader =  " "


set nocompatible
filetype indent plugin on
syntax on
set number
set ttimeoutlen=10
set tabstop=2
set shiftwidth=2

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'udalov/kotlin-vim'
Plug 'vimwiki/vimwiki'
Plug 'hashivim/vim-terraform'
call plug#end()

let g:vimwiki_list = [{'path': '~/Dropbox/Documents/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:airline_powerline_fonts = 1


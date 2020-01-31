if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
call plug#end()

set number                            "display line numbers

let g:airline_powerline_fonts = 1     "include powerline fonts
let g:airline_skip_empty_sections = 1 "hide warning/error powerline arrow
let g:rustfmt_autosave = 1            "auto rustfmt on save

"Syntastic recommended settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


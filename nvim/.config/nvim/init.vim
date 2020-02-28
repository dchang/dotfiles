if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('config') . '/plugged')
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-easy-align'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'w0ng/vim-hybrid'
call plug#end()

set number                            "display line numbersCOLO

colo hybrid

let g:vimwiki_list = [{'path': '~/Documents/wiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:rustfmt_autosave = 1            "auto rustfmt on save

"Syntastic recommended settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Keymaps

map <c-p> :SK<cr>


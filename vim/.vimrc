syntax on

" options {
  set background=dark        " adjusts the default color groups
  set colorcolumn=100        " highlights screen columns
  set noerrorbells           " disable bell for error messages
  set noswapfile             " disable swapfile creation
  set number relativenumber  " show current and relative line numbers
  set expandtab              " use spaces for indents
  set shiftwidth=4           " indent size
  set softtabstop=4          " tab size in insert mode
  set tabstop=4              " tab size
  set termguicolors          " enable 24-bit color in TUI
  set undodir=~/.vim/undodir " directory where undo file is stored
  set undofile               " save undo history to undo file
  set shell=/bin/bash        " avoid fish shell slowdown
" }

" statusline {
  set statusline=
  set statusline+=%{coc#status()}                      " coc status
  set statusline+=%{get(b:,'coc_current_function','')} " coc function
  set statusline+=%=                                   " align right
  set statusline+=%f                                   " file path
" }

" maps {
  let mapleader = ' '

  " yank from the cursor position to the end of the line like C and D ops
  nnoremap Y y$
  nnoremap ; :
  vnoremap ; :

  nnoremap <leader>sv :source $MYVIMRC<CR>
  nnoremap <leader>ba :%bd<CR>

  " toggle search highlight 
  nmap <silent> <leader>/ :noh<CR>
" }

" vim-plug {
  call plug#begin('~/.vim/plugged')
  Plug 'tweekmonster/startuptime.vim'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'junegunn/fzf.vim'
  Plug 'vimwiki/vimwiki'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-surround'
  Plug 'godlygeek/tabular'
  call plug#end()
" }

" gruvbox {
  colorscheme gruvbox8_hard
" }

" vimwiki {
  let g:vimwiki_list = [{'path': '~/Documents/wiki', 'syntax': 'markdown', 'ext': '.md'}]
  
  " prevent associating vimwiki filetype to markdown files outside the vimwiki directory
  let g:vimwiki_global_ext = 0
" }

" fzf {
  nnoremap <leader>fw :Windows<CR>
  nnoremap <leader>fa :Files<CR>
  nnoremap <leader>fs :Rg<CR>
  nnoremap <leader>ff :Buffers<CR>
  nnoremap <leader>fg :GFiles -co --exclude-standard<CR>
  nnoremap <leader>fh :History<CR>
  nnoremap <leader>fl :Lines<CR>
  nnoremap <leader>fc :Commits<CR>
  nnoremap <leader>fb :BCommits<CR>
  nnoremap <leader>fm :Maps<CR>
  
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)
" }

" coc {
  let g:coc_global_extensions = [
  \   'coc-rls',
  \   'coc-python',
  \   'coc-tsserver',
  \   'coc-json',
  \   'coc-snippets',
  \   'coc-markdownlint',
  \   'coc-highlight',
  \   'coc-prettier'
  \ ]
  let g:coc_user_config = {
  \   'coc.preferences.formatOnSaveFiletypes': [
  \     'rust',
  \     'javascript',
  \     'javascriptreact',
  \     'typescript',
  \     'typescriptreact',
  \     'markdown'
  \   ]
  \ }

  runtime config/coc.vim
" }

" tabular {
  nmap <leader>t# :Tab /#<CR>
  vmap <leader>t# :Tab /#<CR>
  nmap <leader>t" :Tab /"<CR>
  vmap <leader>t" :Tab /"<CR>
  nmap <leader>t: :Tab /:\zs<CR>
  vmap <leader>t: :Tab /:\zs<CR>
" }

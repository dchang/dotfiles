syntax on

" options {
  set background=dark        " adjusts the default color groups
  set colorcolumn=80         " highlights screen columns
  set expandtab              " use spaces for indents
  set noerrorbells           " disable bell for error messages
  set noswapfile             " disable swapfile creation
  set number relativenumber  " show line number relative to current line
  set shiftwidth=4           " indent size
  set softtabstop=4          " tab size in insert mode
  set tabstop=4              " tab size
  set termguicolors          " enable 24-bit color in TUI
  set undodir=~/.vim/undodir " directory where undo file is stored
  set undofile               " save undo history to undo file
" }

" statusline {
  set statusline=
  set statusline+=%{coc#status()}                      " coc status
  set statusline+=%{get(b:,'coc_current_function','')} " coc function
  set statusline+=%=                                   " align right
  set statusline+=%t                                   " file name
" }

" maps {
  let mapleader = ' '

  " yank from the cursor position to the end of the line like C and D ops
  nnoremap Y y$

  " toggle search highlight 
  nmap <silent> <leader>/ :set invhlsearch<CR>
" }

" vim-plug {
  call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'vimwiki/vimwiki'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'godlygeek/tabular'
  call plug#end()
" }

" gruvbox {
  let g:gruvbox_contrast_dark = 'hard'
  colorscheme gruvbox
" }

" vimwiki {
  let g:vimwiki_list = [{'path': '~/Documents/wiki', 'syntax': 'markdown', 'ext': '.md'}]
  
  " prevent associating vimwiki filetype to markdown files outside the vimwiki directory
  let g:vimwiki_global_ext = 0
" }

" fzf {
  nnoremap <leader>ff :Files<CR>
  nnoremap <leader>fg :GFiles<CR>
  nnoremap <leader>fb :Buffers<CR>
  nnoremap <leader>fs :Rg<CR>
  nnoremap <leader>fh :History<CR>
  nnoremap <leader>fl :Lines<CR>
  nnoremap <leader>fw :Windows<CR>
  nnoremap <leader>fc :Commits<CR>
  nnoremap <leader>fv :BCommits<CR>
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

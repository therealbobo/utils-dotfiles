set nocompatible
filetype off
set rtp+=~/.local/share/vim/bundle/Vundle.vim

call vundle#begin('~/.local/share/vim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-bufferline'
Plugin 'lervag/vimtex'
Plugin 'SirVer/ultisnips'
call vundle#end()

" Vim settings
"packloadall
filetype plugin indent on
syntax on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set number relativenumber
set showmatch
set backspace=indent,eol,start
set path+=**
set background=dark
set t_Co=256
set undofile
set viminfo+=n~/.cache/vim/viminfo
set undodir=~/.cache/vim/undo
set spelllang=it,en_us
set clipboard=unnamedplus
set encoding=UTF-8
set mouse=a
set hls
"set list lcs=tab:\|\ 


"inoremaps
"inoremap jk <ESC>
"inoremap JK <ESC>

"cnoremap
"sudo edit
cnoremap w!!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!

"remember last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" netrw
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'modified'],
      \             [ 'bufferline'] ]
      \ },
      \ 'component': {
      \   'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before}%#TabLineSel#%{g:bufferline_status_info.current}%#LightLineLeft_active_3#%{g:bufferline_status_info.after}'
      \ }
  \ }

"bufferline
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''

"vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


"ultrasnip
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$XDG_DATA_HOME . "/vim/ultisnips"]
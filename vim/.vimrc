set nocompatible
filetype off
set rtp+=~/.local/share/vim/
set rtp+=~/.local/share/vim/after

" Load vim-plug
if empty(glob("~/.local/share/vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'bling/vim-bufferline'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'tpope/vim-surround'
call plug#end()

" Vim settings
"packloadall
filetype plugin indent on
syntax on
"set noshowmode
set virtualedit=all
set autoindent
set smartindent
set smartcase
set showmatch
set tabstop=4
set shiftwidth=4
set number relativenumber
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
" fancy cmdline completion
set wildmenu

"inoremaps
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

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
let g:vimtex_view_use_temp_files = 1
let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : 'build',
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

"ultrasnip
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$XDG_DATA_HOME . "/vim/ultisnips"]

"go
let g:go_highlight_types     = 1 
let g:go_highlight_fields    = 1 
let g:go_highlight_structs   = 1 
let g:go_highlight_methods   = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types       = 1 
let g:go_highlight_functions_calls   = 1
let g:go_highlight_build_constraints = 1

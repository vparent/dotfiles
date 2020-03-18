syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

if !has('nvim')
	set nocp
	set ttymouse=xterm2
endif

set nocompatible

set encoding=utf-8
set spelllang=fr,en

set showcmd
set smartcase
set smarttab
set smartindent
set number relativenumber
set autoindent

set foldenable
set foldmethod=syntax

" Always wrap long lines:
set wrap

"set background="dark"
"set termguicolors

set laststatus=2
set noshowmode

set mouse=a

set splitbelow
set splitright

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set backspace=indent,eol,start
set ruler
set incsearch
set hlsearch

set clipboard=unnamedplus

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set showmatch

set wildmenu
set lazyredraw

set textwidth=110
set colorcolumn=111
highlight ColorColumn ctermbg=darkgrey

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <F6> :setlocal spell! spelllang=fr,en<CR>

nnoremap <C-t> :tabnew<cr>
nnoremap <F5> <Esc>:w<CR>:!clear;python %<CR>

nnoremap <C-g> <CR>:!gcc %;./a.out<CR>

nnoremap <C-m>b : !make all<cr>
nnoremap <C-m>c : !make clean<cr>
nnoremap <C-m>t : !make test<cr>
nnoremap <C-m>m : !make main<cr>

nnoremap <space> za
nnoremap gV `[v`]
inoremap jk <esc>

let g:mapleader=","

autocmd Filetype python source $HOME/.vim/conf/py.vim
autocmd Filetype vim set foldmethod=marker

"colorscheme Mustang

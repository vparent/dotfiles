" Use " for commenting
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
syntax on

set encoding=utf-8
set spelllang=fr,en

set nocompatible
set showcmd
"set ignorecase
set smartcase
set smarttab
set smartindent
set number relativenumber
set autoindent
set cindent
set nocp

set foldenable
set foldmethod=syntax
autocmd Filetype python set foldmethod=indent

" Always wrap long lines:
set wrap

set background=dark

if has('nvim')
        " Neovim specific commands
        let g:python_host_prog = '/usr/bin/python2'
        let g:python3_host_prog = '/usr/bin/python3'
else
        " Vim specific commands
        set guiheadroom=0
endif


set laststatus=2
"set showtabline=2
set noshowmode

set mouse=a

set splitbelow
set splitright

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set omnifunc=ale#completion#OmniFunc

set backspace=indent,eol,start
set ruler
set display=truncate
set incsearch
set hlsearch

set clipboard=unnamedplus

set ts=4
set softtabstop=4
set expandtab
set shiftwidth=4
set showmatch

set wildmenu
set lazyredraw

set textwidth=79
"autocmd FileType python set textwidth=79

" Autopep8 settings
autocmd FileType python noremap <buffer> <F8> : call Autopep8()<CR>

let g:autopep8_pep8_passes = 100
let g:autopep8_max_line_length = 79
let g:autopep8_aggressive=2
let g:autopep8_indent_size=2
let g:autopep8_disable_show_diff=0
let g:autopep8_diff_type='vertical'

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <F6> :setlocal spell! spelllang=fr,en<CR>

nnoremap <C-t> :tabnew<cr>
"nnoremap <F5> :exec'!python' shellescape (@%, 1)<cr>
nnoremap <F5> <Esc>:w<CR>:!clear;python %<CR>

nnoremap <C-m>b : !make all<cr>
nnoremap <C-m>c : !make clean<cr>
nnoremap <C-m>t : !make test<cr>
nnoremap <C-m>m : !make main<cr>

" press space to toggle folding
nnoremap <space> za

nnoremap gV `[v`]

inoremap jk <esc>

nmap <F7> :TagbarToggle<CR>

let g:python_hightlight_all = 1

let g:mapleader=","

runtime! archlinux.vim

let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
let g:airline_solarized_bg='dark'
let g:airline_detect_paste=1

let g:airline#extensions#ale#enabled=1

function! CMakeStat()
    let l:cmake_build_dir = get(g:, 'cmake_build_dir', 'build')
    let l:build_dir = finddir(l:cmake_build_dir, '.;')

    let l:retstr = ""
    if l:build_dir != ""
      if filereadable(build_dir . '/CMakeCache.txt')
          let cmcache = readfile(build_dir . '/CMakeCache.txt')
          for line in cmcache
              if line =~ "CMAKE_BUILD_TYPE"
                  let value = reverse(split(line, '='))[0]
                  let retstr = retstr . value . " "
              elseif line =~ "RUN_TESTS"
                  let value = reverse(split(line, '='))[0]
                  let retstr = retstr . "T" . value . " "
              endif
          endfor
      endif
    endif
    return substitute(retstr, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

let g:EasyMotion_startofline = 0
map <Leader>J <Plug>(easymotion-sol-j)
map <Leader>K <Plug>(easymotion-sol-k)
map <Leader>w <Plug>(easymotion-iskeyword-w)
map <Leader>b <Plug>(easymotion-iskeyword-b)

let g:NERDTreeShowIgnoredStatus = 1
map <Leader>t :NERDTreeToggle .<CR>
map <Leader>ts :NERDTreeToggle /<CR>
map <Leader>te :NERDTreeToggle /etc<CR>

call airline#parts#define('cmake', {'function': 'CMakeStat'})
let g:airline_section_b = airline#section#create_left(['cmake'])

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit = "context"
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippet = "/usr/share/vim/vimfiles/UltiSnips"

let g:ale_completion_enabled=1
let g:ale_lint_on_save=0
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_filetype_changed=-1
let g:ale_fix_on_save=0
let g:ale_open_list=0
let g:ale_linters = {
            \'pyhton': ['flake8', 'pylint'],
            \'c': 'all',
            \'cpp': 'all',
            \'javascript': ['eslint'],
            \'html': ['prettier'],
            \}
let g:ale_fixers= {
            \'javascript': ['eslint', 'prettier'],
            \'c': ['clang-format'],
            \'cpp': ['clang-format'],
            \'html': ['prettier'],
            \'python': ['autopep8'],
            \'json': ['prettier'],
            \}
let g:ale_linters_explicit=0

let g:ale_c_gcc_options='-std=c90 -Wall -W -Wextra -pedantic'
let g:ale_set_balloons=1
nmap <silent> <C-k> <Plug>{ale_previous_wrap}
nmap <silent> <C-j> <Plug>{ale_next_wrap}

set completeopt=menu,menuone,preview,noselect,noinsert

nnoremap <C-n>c :ALELint<CR>
nnoremap <C-n>f :ALEFix<CR>
nnoremap <C-n>d :ALEDetail<CR>

let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Display_Prototype = 1
let Tlist_Display_Tag_Scope = 1
nnoremap <C-l> :TlistToggle<CR>

call plug#begin('~/.vim/plugged')
    Plug 'calviken/vim-gdscript3'
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugin' }
        Plug 'rbgrouleff/bclose.vim'
    endif
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'deoplete-plugins/deoplete-jedi'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'Shougo/deoplete-clangx'
    Plug 'ternjs/tern_for_vim', {'do': 'npm install' }
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'

    Plug 'lighttiger2505/deoplete-vim-lsp'

    Plug 'xavierd/clang_complete'

    Plug 'francoiscabrol/ranger.vim'

    Plug 'CaffeineViking/vim-glsl'

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    Plug 'tpope/vim-surround'
call plug#end()

let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete=1
call deoplete#custom#option({
\ 'autocomplete': v:true,
\ 'auto_complete_delay': 5,
\ 'smartcase': v:true,
\ })

if (executable('pyls'))
    let s:pyls_path = fnamemodify('python', ':h') . '/' . 'pyls'
    augroup LspPython
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \'name': 'pyls',
                    \'cmd': {server_info->['pyls']},
                    \'whitelist': ['python']
                    \})
    augroup END
endif
if executable('clangb')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'clangd',
                \ 'cmd': {server_info->['clangd', '-background-index']},
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
                \ })
endif

let g:clang_library_path='/usr/lib/libclang.so.8'

map <Leader>f :Ranger<CR>

autocmd! BufNewFile,BufRead *vs,*gs,*fs set ft=glsl

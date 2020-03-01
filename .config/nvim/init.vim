set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
    Plug 'dense-analysis/ale'
	Plug 'prabirshrestha/async.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'sheerun/vim-polyglot'
    Plug 'majutsushi/tagbar'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugin' }

	" Deoplete sources {{{1 "
	 "Plug 'Shougo/deoplete-clangx'
	 Plug 'Shougo/neco-vim'
	 Plug 'Shougo/neoinclude.vim'
	 Plug 'Shougo/neco-syntax'
	 Plug 'Shougo/vimshell.vim'
	 Plug 'deoplete-plugins/deoplete-jedi'
	 Plug 'wellle/tmux-complete.vim'
	 Plug 'php-vim/phpcd.vim', {'for': 'php', 'do': 'composer install'}
	 Plug 'lighttiger2505/deoplete-vim-lsp'
	" 1}}} "
	
	Plug 'SirVer/ultisnips' 

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-fugitive'
    Plug 'calviken/vim-gdscript3'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
call plug#end()

let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1
let g:airline_solarized_bg='dark'
let g:airline_detect_paste=1
let g:airline#extensions#ale#enabled=1

" deoplete settings {{{1 "
let g:deoplete#enable_at_startup = 1
"let g:deoplete#ignore_case = 0
let g:deoplete#smart_case = 1

let g:deoplete#sources#jedi#enable_typeinfo = 1

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let auto_complete_delay = 500
" deoplete settings}}} "

let g:clang_library_path='/usr/lib/libclang.so'
let g:NERDTreeShowIgnoredStatus = 1

map <Leader>t :NERDTreeToggle .<CR>
map <Leader>ts :NERDTreeToggle /<CR>
map <Leader>te :NERDTreeToggle /etc<CR>

let g:UltiSnipsEditSplit = "context"
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippet = "/usr/share/vim/vimfiles/UltiSnips"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:ale_completion_enabled=0
let g:ale_lint_on_save=0
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_filetype_changed=0
let g:ale_fix_on_save=0
let g:ale_open_list=0
let g:ale_linters = {
            \'pyhton': ['pylint'],
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

autocmd! BufNewFile,BufRead *vs,*gs,*fs set ft=glsl

let g:lsp_fold_enabled = 0
let g:lsp_signature_help_enabled = 0

nmap <F7> :TagbarToggle<CR>

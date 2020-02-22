au BufRead,BufNewFile *.py,*.pyw set tabstop=8
au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab

fu Select_c_style()
	if search('^\t', 'n', 150)
		set shiftwidth=8
		set noexpandtab
	el
		set shiftwidth=4
		set expandtab
	en
endf

au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

highlight BadWhitespace ctermbg=red guibg=red

au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

au BufRead,BufNewFile *.py,*.pyw set textwidth=79

au BufNewFile *.py,*.pyw set fileformat=unix

let python_highlight_all=1

set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

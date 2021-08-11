" replaced with all.snippets
" iab <expr> dts strftime("%a, %FT%T%z")

" automatically turn off highlight search after searching
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" automatically loadview
augroup AutoFold
	autocmd!
	autocmd BufWinEnter ?* silent! loadview | filetype detect
augroup END


"
" wiki notes related settings
"

" wiki note related mapping
" Quickly create a new zk note
command! -nargs=1 NewZettel :execute ":sp" $ZK_DIR . strftime("%Y%m%d%H%M") . "-<args>.md"
nnoremap <leader>zn :NewZettel 

" Generate ctags
nnoremap <leader>zt :!ctags -R --exclude=README.md . <CR>

" Binding for searching tags ("search tag")
" nnoremap <leader>st :CtrlPTag<CR>

" fzf.vim function for inserting a filename

" Adapted from here
" <https://www.frrobert.com/blog/linkingzettelkasten-2020-05-11-0735>
" This would allow me to search inside notes, not just title
function! s:make_note_link(l)
        " fzf#vim#complete returns a list with all info in index 0
				" file name is separated from the file content with ':'
				" line will be a list
        let line = split(a:l[0], ':')
				" full file name is at index 0 of the list
        let ztk_id = l:line[0]
				" only keep the text after the time stamp and save as the title
				let ztk_title = fnameescape(fnamemodify(l:line[0], ':t:s/\d\+-//'))
        let mdlink = "[" . ztk_title ."](". ztk_id .")"
        return mdlink
endfunction

" mnemonic link zettel
inoremap <expr> <c-l>z fzf#vim#complete({
  \ 'source':  'rg --no-heading --smart-case --no-require-git .',
  \ 'reducer': function('<sid>make_note_link'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'up':    10})


" Find backlinks to current file and open quickfix list with the results  
" Does not work for me at the moment
" command! -nargs=0 Ngrepl :execute "grep -F '" . " ]
" 	\( " . expand("%:t") . " )" .  "'" | :copen 1 nnoremap <leader>zb 
" 	\:Ngrepl<CR><CR>

" What to ignore while searching files, speeds up CtrlP
" set wildignore+=*/.git/*,*/tmp/*,*.swp

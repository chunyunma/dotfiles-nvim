" tell vim to use ripgrep instead of the native grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" mapping for fzf searching file names
nnoremap <silent> <C-f> :Files<CR>
" mapping for rg searching content within files
nnoremap <silent> <Leader>f :Rg<CR>
" only search content not file name
command! -bang -nargs=* Rg call 
	\fzf#vim#grep("rg --column --line-number --no-heading --follow 
	\--color=always --smart-case ".shellescape(<q-args>), 1, 
	\{'options': '--delimiter : --nth 4..'}, <bang>0)

" use the silver searcher instead of rg to do full text search;
" do not work as intended at the moment yet
" <https://github.com/junegunn/fzf/wiki/Examples-(vim)>
" nnoremap <silent> <Leader>f :Ag<CR>
" function! s:ag_to_qf(line)
"   let parts = split(a:line, ':')
"   return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
"         \ 'text': join(parts[3:], ':')}
" endfunction
"
" function! s:ag_handler(lines)
"   if len(a:lines) < 2 | return | endif
"
"   let cmd = get({'ctrl-x': 'split',
"                \ 'ctrl-v': 'vertical split',
"                \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
"   let list = map(a:lines[1:], 's:ag_to_qf(v:val)')
"
"   let first = list[0]
"   execute cmd escape(first.filename, ' %#\')
"   execute first.lnum
"   execute 'normal!' first.col.'|zz'
"
"   if len(list) > 1
"     call setqflist(list)
"     copen
"     wincmd p
"   endif
" endfunction
"
" command! -nargs=* Ag call fzf#run({
" \ 'source':  printf('ag --nogroup --column --color "%s"',
" \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
" \ 'sink*':    function('<sid>ag_handler'),
" \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
" \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
" \            '--color hl:68,hl+:110',
" \ 'down':    '50%'
" \ })

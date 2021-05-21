" a temporary fix until the gx bug is fixed
" function! OpenURLUnderCursor()
"   let s:uri = expand('<cfile>')
"   echom "s:uri = " . s:uri
"   if s:uri != ''
"     silent exec "!open '".s:uri."'"
"     :redraw!
"   endif
" endfunction
" nnoremap gx :call OpenURLUnderCursor()<CR>
"
" Settings for open-browser
"
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)



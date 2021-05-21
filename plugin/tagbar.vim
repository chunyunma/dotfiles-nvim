"
" tagbar 
"
nnoremap <silent> <F8> :TagbarOpen: fj<CR>

" tagbar support for markdown --------

let g:md_ctags_bin=fnamemodify(stdpath('config')."/tools/markdown2ctags.py", ":p")

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown.pandoc',
    \ 'ctagsbin' : g:md_ctags_bin,
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }

let g:rmd_ctags_bin=fnamemodify(stdpath('config')."/tools/rmdtags.py", ":p")
let g:tagbar_type_rmd = {
          \   'ctagstype':'rmd'
          \ , 'kinds':['h:header', 'c:chunk', 'f:function', 'v:variable']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header', 'c':'chunk'}
          \ , 'sort':0
          \ , 'ctagsbin':g:rmd_ctags_bin 
          \ , 'ctagsargs': ''
          \ }


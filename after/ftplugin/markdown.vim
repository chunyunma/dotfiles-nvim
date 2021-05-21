setlocal autoindent
setlocal tabstop=2
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
" to enable syntax highlight for code blocks
" au BufNewFile,BufReadPost *.md set filetype=markdown " I don't this this line is necessary
let g:markdown_fenced_languages = ['bash=sh', 'py=python', 'html', 'r', 'tex']

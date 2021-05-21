setlocal expandtab
setlocal autoindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

"
" different highlight for latex inside rmarkdown file
"
function! Math()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    "" Actually highlight those regions.
    hi link math Statement
    hi link math_block Function
endfunction

" Call everytime we open an rmarkdown file
autocmd BufRead,BufNewFile,BufEnter *.Rmd,*.rmarkdown, call Math()

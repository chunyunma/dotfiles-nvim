setlocal expandtab
setlocal autoindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
" setting filetype to tex to get the syntax highlight 
augroup rmdtex
	autocmd!
	autocmd BufRead,BufNewFile,BufEnter 
				\ */matrix_algebra/*.Rmd,*/statistical_learning/*.Rmd 
				\ setlocal filetype=tex
augroup END

"
" highlight for latex inside rmarkdown file
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
autocmd BufRead,BufNewFile,BufEnter */baby-modern-dive/*.Rmd,*/baby-modern-dive/*.rmarkdown call Math()

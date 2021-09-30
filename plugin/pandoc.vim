let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
" disable spelling check
" <https://github.com/vim-pandoc/vim-pandoc/blob/master/doc/pandoc.txt>
let g:pandoc#spell#enabled = 0
" disable folding by default
let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#hypertext#split_open_cmd = "leftabove split"
" <https://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/>

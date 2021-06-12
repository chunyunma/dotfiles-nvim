" let g:UltiSnipsExpandTrigger = '<tab>'
" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'
" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
" use both default and customized snippets
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
" use only customized snippets
let g:UltiSnipsSnippetDirectories=[$XDG_CONFIG_HOME.'/nvim/my_snippets']

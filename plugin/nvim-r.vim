"
" Nvim-R -------
"
" set R path; only need this for CRAN R
let R_path = '/Library/Frameworks/R.framework/Versions/Current/Resources/bin'
" Change default to no saving work image and no startup message
" This only affects the behaviour of R inside vim
let R_args = ['--no-save', '--quiet']
" quick insert chunk delimiter in rmd with two instead of one backticks
let R_rmdchunk = '``'
let R_assign = 0
nmap <LocalLeader>: :RSend 
" use visidata to view data frames
let R_csv_app = 'terminal:vd'
nmap <silent> <LocalLeader>vh :call RAction("viewobj", 
	\", howto='topleft 11sp', nrows=5")<CR>
" objects from kniting will not be placed in the global env
let R_rmd_environment = 'new.env()'
" enable commands in insert mode
let R_insert_mode_cmds = 1
" don't set working directory
let R_nvim_wd = -1
" enable nvim-r for any files
command RStart let oldft=&ft | set ft=r | exe 'set ft='.oldft | 
	\let b:IsInRCode = function("DefaultIsInRCode") | normal <LocalLeader>rf
" <https://github.com/jalvesaq/Nvim-R/issues/559>
" show help in horizontal split
let R_nvimpager = "horizontal"

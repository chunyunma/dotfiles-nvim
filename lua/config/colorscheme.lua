local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)
utils.opt('o', 'background', 'dark')
-- cmd 'colorscheme onedark'
cmd 'colorscheme gruvbox-material'

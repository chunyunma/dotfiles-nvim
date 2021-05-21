local utils = require('utils')

utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>') -- jk to escape

-- easier nav panes
utils.map('n', '<C-H>', '<C-W><C-H>')
utils.map('n', '<C-J>', '<C-W><C-J>')
utils.map('n', '<C-K>', '<C-W><C-K>')
utils.map('n', '<C-L>', '<C-W><C-L>')

utils.map('i', '<C-u>', '<C-g>u<C-u>')  -- Make <C-u> undo-friendly
utils.map('i', '<C-w>', '<C-g>u<C-w>')  -- Make <C-w> undo-friendly

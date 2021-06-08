-- local utils = require('utils')

local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

bo.tabstop = indent
bo.softtabstop = indent
bo.shiftwidth = indent
-- bo.expandtab = true
bo.smartindent = true
o.hidden = true
o.ignorecase = true
o.smartcase = true
o.scrolloff = 4
o.shiftround = true
o.splitbelow = true
o.splitright = true
o.wildmode = 'list:longest'
wo.number = true
wo.colorcolumn = "80"
-- wo.relativenumber = true
wo.scrolloff = 8
wo.cursorline = true
o.clipboard = 'unnamed,unnamedplus'

bo.undofile = true
o.undolevels = 10000
o.undoreload = 10000

-- o.completeopt = 'preview,menuone,noselect'
o.completeopt = 'menuone,noselect'

-- Highlight on yank
-- vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- Auto format
-- vim.api.nvim_exec([[
-- augroup auto_fmt
--     autocmd!
--     autocmd BufWritePre *.py,*.lua undojoin | Neoformat
-- aug END
-- ]], false)

-- vim.api.nvim_exec([[
-- augroup auto_spellcheck
--     autocmd!
--     autocmd BufNewFile,BufRead *.md setlocal spell
--     autocmd BufNewFile,BufRead *.org setfiletype markdown
--     autocmd BufNewFile,BufRead *.org setlocal spell
--     autocmd BufNewFile,BufRead *.html setlocal ts=2 sw=2
--     autocmd BufNewFile,BufRead *.js setlocal ts=2 sw=2
--     autocmd BufNewFile,BufRead *.json setlocal syntax=off
-- augroup END
-- ]], false)
-- 
-- vim.api.nvim_exec([[
-- augroup auto_term
--     autocmd!
--     autocmd TermOpen * setlocal nonumber norelativenumber
--     autocmd TermOpen * startinsert
-- augroup END
-- ]], false)
-- 
-- vim.api.nvim_exec([[
--     fun! TrimWhitespace()
--         let l:save = winsaveview()
--         keeppatterns %s/\s\+$//e
--         call winrestview(l:save)
--     endfun
-- 
--     autocmd BufWritePre * :call TrimWhitespace()
-- ]], false)

-- Map leader and localleader
vim.g.mapleader = ';'
vim.g.maplocalleader = ','

vim.g.netrw_banner = 0
-- temporary fix for the gx bug
vim.g.netrw_nogx=1

if vim.fn.has('macunix') then
	vim.g.python3_host_prog='/Users/chunyun/.pyenv/versions/neovim/bin/python'
	vim.g.python_host_prog='/Users/chunyun/.pyenv/versions/neovim-py2/bin/python'
end

vim.g.sessionoptions="curdir,folds,resize,winsize"

local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
end
vim.cmd [[packadd packer.nvim]]
-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- LSP
require('lang')

-- DAP
-- require('dbg')

-- Another option is to group configuration in one folder
require('config')

-- OR you can invoke them individually here
-- require('config.colorscheme')  -- color scheme
-- require('config.completion')   -- completion
-- require('config.fugitive')     -- fugitive


-- Map leader and localleader
vim.g.mapleader = ';'
vim.g.maplocalleader = ','

vim.g.netrw_banner = 0
-- temporary fix for the gx bug
-- vim.g.netrw_nogx=1

if vim.fn.has("mac") == 1 then
	vim.g.python3_host_prog='/Users/chunyun/.pyenv/versions/neovim/bin/python'
	vim.g.python_host_prog='/Users/chunyun/.pyenv/versions/neovim-py2/bin/python'
end

vim.g.sessionoptions="curdir,folds,resize,winsize"

-- Sensible defaults
require('settings')

-- set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
require('lazy').setup('plugins')

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


-- XXX: vim.g.mapleader must be initialized _before_ lazy.nvim is loaded,
-- so builtin options are configured first
require('config')

-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath('data') .. 'lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=v10.20.4',
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

-- Install and configure packages
require('plugins')

-- Configure theme
require('theme')

-- Configure keybindings
require('keymap')

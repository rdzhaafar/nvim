local telescope_builtin = require('telescope.builtin')
local telescope_utils = require('telescope.utils')

local current_dir = function()
	return telescope_utils.buffer_dir()
end

--
-- Keybindings
--
vim.keymap.set('n', '<leader>e', vim.cmd.Explore)

vim.keymap.set('n', '<leader>t', telescope_builtin.buffers)

vim.keymap.set('n', '<leader>rc', function()
	local config_dir = vim.fn.stdpath('config')
	vim.cmd.Explore(config_dir)
end)

vim.keymap.set('n', '<leader>rg', function()
	telescope_builtin.live_grep({
		search_dirs = { current_dir() },
	})
end)

vim.keymap.set('n', '<leader>ff', function()
	telescope_builtin.find_files({
		search_dirs = { current_dir() },
	})
end)

vim.keymap.set('n', '<leader>gd', telescope_builtin.lsp_references)

vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover)

vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)

vim.keymap.set('n', '<leader>fb', vim.lsp.buf.format)

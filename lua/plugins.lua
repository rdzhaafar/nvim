--
-- lazy.nvim packages
--
require('lazy').setup({
	{ 'nvim-telescope/telescope.nvim',   tag = '0.1.6',  dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'lewis6991/gitsigns.nvim',         tag = 'v0.8.1' },
	{ 'ellisonleao/gruvbox.nvim',        tag = '2.0.0' },
	{ 'neovim/nvim-lspconfig',           tag = 'v0.1.7' },
	{ 'nvim-treesitter/nvim-treesitter', tag = 'v0.9.2' },
	{ 'VonHeikemen/lsp-zero.nvim',       branch = 'v3.x' },
	{ 'L3MON4D3/LuaSnip',                tag = 'v2.3.0' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
})

--
-- lsp-zero
--
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

--
-- LSP
--
require('lspconfig').gopls.setup({})
require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})


--
-- Treesitter
--
local treesitter_parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
treesitter_parser_configs.gotmpl = {
	install_info = {
		url = "https://github.com/ngalaiko/tree-sitter-go-template",
		files = { "src/parser.c" },
	},
	filetype = 'gotmpl',
	used_by = { 'gohtmltmpl', 'gotexttmpl', 'gotmpl', 'yaml' }
}
require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'c',
		'lua',
		'vim',
		'vimdoc',
		'query',
		'go',
		'rust',
		'javascript',
		'html',
		'json',
		'gotmpl',
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})

--
-- Gitsigns
--
require('gitsigns').setup({
	current_line_blame = true,
})

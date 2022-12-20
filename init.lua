vim.opt.tabstop = 4

vim.opt.shiftwidth = 4
vim.opt.expandtab = false

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
	print('Done.')

	vim.cmd('packadd packer.nvim')
	install_plugins = true
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lualine/lualine.nvim'
	-- colorschemes
	use 'joshdick/onedark.vim'
	use 'lunarvim/darkplus.nvim'
	if install_plugins then
		require('packer').sync()
	end
	use 'akinsho/bufferline.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'godlygeek/tabular'
end)
vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')
require('lualine').setup()

require('bufferline').setup({
	options = {
		mode = 'buffers',
		offsets = {
			{filetype = 'NvimTree'}
		},
	},
	highlights = {
		buffer_selected = {
			italic = false
		},
		indicator_selected = {
			fg = {attribute = 'fg', highlight = 'Function'},
			italic = false
		}
	}
})

require('indent_blankline').setup({
	char = '▏',
	--char = '|',
})

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  disable = {'latex'},
  ensure_installed = {
	'vim',
    'json',
    'lua',
	'cpp',
--		'latex',
  },
})


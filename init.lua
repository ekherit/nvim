require('plugins')
require('settings') 
require('keymaps')

vim.opt.number = true
vim.opt.termguicolors = true
vim.cmd('colorscheme onedark')
vim.cmd('set clipboard+=unnamedplus')

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

require('telescope').setup({
defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
  })

require'lspconfig'.clangd.setup({
})



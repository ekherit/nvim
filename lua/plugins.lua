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

	use 'akinsho/bufferline.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'godlygeek/tabular'

	--use 'nvim-lua/plenary.nvim'

	use { 'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end, }
    -- Навигация внутри файла по классам и функциям
    use 'majutsushi/tagbar'
    -- Замена fzf и ack
    use { 'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'telescope'.setup {} end, }

	if install_plugins then
		require('packer').sync()
	end

	use 'powerman/vim-plugin-ruscmd'

	-- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
	 -- Автодополнялка
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    --- Автодополнлялка к файловой системе
    use 'hrsh7th/cmp-path'
    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'

	use 'adam-wolski/nvim-lsp-clangd-highlight'
	use 'codeindulgence/vim-tig'
end)

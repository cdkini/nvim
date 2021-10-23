local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use { 
    "nvim-lua/plenary.nvim",
  }
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }
--  use 'ahmedkhalf/lsp-rooter.nvim'
--  use 'akinsho/toggleterm.nvim'
--  use 'chentau/marks.nvim'
--  use 'folke/trouble.nvim'
--  use 'folke/which-key.nvim'
--  use 'henriquehbr/nvim-startup.lua'
--  use 'hoob3rt/lualine.nvim'
--  use 'hrsh7th/nvim-cmp'
--  use 'hrsh7th/vim-vsnip'
--  use 'ibhagwan/fzf-lua'
--  use 'karb94/neoscroll.nvim'
--  use 'kyazdani42/nvim-tree.lua'
--  use 'kyazdani42/nvim-web-devicons'
--  use 'lewis6991/gitsigns.nvim'
--  use 'liuchengxu/vista.vim'
--  use 'mbbill/undotree'
--  use 'mfussenegger/nvim-dap'
--  use 'mhinz/vim-startify'
--  use 'neovim/nvim-lspconfig'
--  use 'nvim-telescope/telescope.nvim'
--  use 'nvim-treesitter/nvim-treesitter'
--  use 'onsails/lspkind-nvim'
--  use 'rafamadriz/friendly-snippets'
--  use 'ray-x/lsp_signature.nvim'
--  use 'rcarriga/vim-ultest'
--  use 'romgrk/barbar.nvim'
--  use 'sainnhe/gruvbox-material'
--  use 'szw/vim-maximizer'
--  use 'terrortylor/nvim-comment'
--  use 'tpope/vim-eunuch'
--  use 'tpope/vim-fugitive'
--  use 'tpope/vim-repeat'
--  use 'tpope/vim-rhubarb'
--  use 'tpope/vim-surround'
--  use 'tversteeg/registers.nvim'
--  use 'wbthomason/packer.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
   use 'wbthomason/packer.nvim' -- Plugin manager
   use { -- Colorscheme
     'sainnhe/everforest',
     config = function()
       require('plugins.config.colorscheme')
     end
   }
   use { -- Pretty icons
     'kyazdani42/nvim-web-devicons',
   }
   use { -- Statusline
     'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true },
     config = function()
       require('plugins.config.lualine')
     end
   }
   use { -- Bufferline
     'romgrk/barbar.nvim',
     requires = {'kyazdani42/nvim-web-devicons'},
     config = function()
       require('plugins.config.barbar')
     end
   }
   use { -- Syntax highlighting
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate',
     config = function()
       require('plugins.config.treesitter') 
     end
   }
   use { -- LSP
     'neovim/nvim-lspconfig',
     requires = { 'ms-jpq/coq_nvim', 'ms-jpq/coq.artifacts', 'ray-x/lsp_signature.nvim' },
     config = function()
       require('plugins.config.lspconfig')
     end
   }
   use { -- Fuzzy finder
     'nvim-telescope/telescope.nvim',
     requires = { 'nvim-lua/plenary.nvim' },
     config = function()
       require('plugins.config.telescope')
     end
   }
   use { -- Git integration
     'tpope/vim-fugitive',
     requires = { 'tpope/vim-rhubarb' },
     config = function()
       require('plugins.config.fugitive')
     end
   }
   use { -- Git gutter support
     'lewis6991/gitsigns.nvim',
     requires = { 'nvim-lua/plenary.nvim' },
     config = function()
       require('plugins.config.gitsigns')
     end
   }
   use { -- Autochdir
     'ahmedkhalf/lsp-rooter.nvim',
     config = function()
       require('plugins.config.lsp-rooter')
     end
   }
   use { -- Explorer
     'kyazdani42/nvim-tree.lua',
     requires = { 'kyazdani42/nvim-web-devicons' },
     config = function() 
       require('plugins.config.nvim-tree')
     end
   }
   use { -- Diagnostics
     'folke/trouble.nvim',
     requires = 'kyazdani42/nvim-web-devicons',
     config = function()
       require('plugins.config.trouble')
     end
   }
   use { -- Marks
     'chentau/marks.nvim',
     config = function()
       require('plugins.config.marks')
     end
   }
   use { -- Smooth scrolling
     'karb94/neoscroll.nvim',
     config = function()
       require('plugins.config.neoscroll')
     end
   }
   use { -- Key preview / reminder
     'folke/which-key.nvim',
     config = function()
       require('plugins.config.which-key')
     end
   }
   use {
     "iamcco/markdown-preview.nvim",
     run = "cd app && npm install",
     ft = "markdown"
   }
   use 'lukas-reineke/indent-blankline.nvim' -- Indent markers
   use 'mhinz/vim-startify' -- Dashboard
   -- tpope the GOAT
   use 'tpope/vim-commentary' 
   use 'tpope/vim-eunuch'
   use 'tpope/vim-repeat'
   use 'tpope/vim-surround'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

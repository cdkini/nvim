local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require('packer')
local util = require('packer.util')

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use
  use { -- Plugin manager
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }
  use { -- Colorscheme
    'rmehri01/onenord.nvim',
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
    config = function()
      require('plugins.config.lspconfig')
    end
  }
  use { -- Completion engine
    'hrsh7th/nvim-compe',
    config = function()
      require('plugins.config.nvim-compe')
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
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
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
  use { -- Key preview / reminder
    'folke/which-key.nvim',
    config = function()
      require('plugins.config.which-key')
    end
  }
  use 'mhinz/vim-startify' -- Dashboard
  use 'tpope/vim-commentary' -- tpope the GOAT
  use 'tpope/vim-eunuch'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tweekmonster/startuptime.vim' -- Performance
  end
)

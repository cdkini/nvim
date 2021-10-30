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
  -- Colorscheme
  use {
    'rmehri01/onenord.nvim',
    config = function()
      require('plugins.config.colorscheme')
    end
  }
  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.config.treesitter') 
    end
  }
  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('plugins.config.telescope')
    end
  }
  -- Git integration
  use {
    'tpope/vim-fugitive',
    config = function()
      require('plugins.config.fugitive')
    end
  }
  -- Git gutter support
  use {
    'lewis6991/gitsigns.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('plugins.config.gitsigns')
    end
  }
  -- Key preview / reminder
  use {
    'folke/which-key.nvim',
    config = function()
      require('plugins.config.which-key')
    end
  }
  end
)

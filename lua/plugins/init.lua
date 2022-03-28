vim.cmd "packadd packer.nvim"

local ok, packer = pcall(require, "packer")

if not ok then
    local packer_path = vim.fn.stdpath "data" ..
                            "/site/pack/packer/opt/packer.nvim"

    print "Cloning packer.."
    -- remove the dir before cloning
    vim.fn.delete(packer_path, "rf")
    vim.fn.system {
        "git", "clone", "https://github.com/wbthomason/packer.nvim", "--depth",
        "20", packer_path
    }

    vim.cmd "packadd packer.nvim"
    ok, packer = pcall(require, "packer")

    if ok then
        print "Packer cloned successfully."
    else
        error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" ..
                  packer)
    end
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "single"}
        end,
        prompt_border = "single"
    },
    git = {
        clone_timeout = 6000 -- seconds
    },
    auto_clean = true,
    compile_on_sync = true
}

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Dict to supply mappings in 'setup'
mappings = require('core.mappings')

-- Utility to aid with performance
packer_lazy_load = function(plugin, timer)
    if plugin then
        timer = timer or 0
        vim.defer_fn(function() require("packer").loader(plugin) end, timer)
    end
end

-- Install your plugins here
local plugins = {
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "lewis6991/impatient.nvim"
    },
    {
        "nathom/filetype.nvim"
    },
    {
        "wbthomason/packer.nvim",
        event = "VimEnter"
    },
    {
        'tpope/vim-commentary'
    },
    {
        'tpope/vim-eunuch'
    },
    {
        'tpope/vim-repeat'
    },
    {
        'tpope/vim-surround'
    },
    {
        'jedi2610/nvim-rooter.lua',
        config = function() require'nvim-rooter'.setup() end
    },
    {
        'chentau/marks.nvim',
        config = function() require('marks').setup({}) end
    },
    {
        'karb94/neoscroll.nvim',
        config = function() require('neoscroll').setup({}) end
    },
    {
        'szw/vim-maximizer',
        cmd = "MaximizerToggle",
        setup = function() mappings.maximizer() end
    },
    {
        'sainnhe/gruvbox-material',
        config = function() require('plugins.config.colorscheme') end
    },
    {
        "kyazdani42/nvim-web-devicons",
        after = "gruvbox-material"},
    {
        'nvim-lualine/lualine.nvim',
        after = "nvim-web-devicons",
        config = function() require('plugins.config.lualine') end
    },
    {
        'romgrk/barbar.nvim',
        after = "nvim-web-devicons",
        setup = function() mappings.barbar() end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = "BufRead"
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = {"BufRead", "BufNewFile"},
        config = function() require('plugins.config.treesitter') end,
        run = ':TSUpdate'
    },
    {
        'tpope/vim-fugitive',
        requires = 'tpope/vim-rhubarb',
        setup = function()
            mappings.fugitive()
            packer_lazy_load "vim-fugitive"
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        opt = true,
        config = function() require('plugins.config.gitsigns') end,
        setup = function() packer_lazy_load "gitsigns.nvim" end
    },
    {
        "neovim/nvim-lspconfig",
        module = "lspconfig",
        opt = true,
        setup = function()
            packer_lazy_load "nvim-lspconfig"
            -- reload the current file so lsp actually starts for it
            vim.defer_fn(function()
                vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            end, 0)
        end,
        config = function() require('plugins.config.lspconfig') end
    },
    {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function() require('plugins.config.lsp_signature') end
    },
    {
        "andymass/vim-matchup",
        opt = true,
        setup = function() packer_lazy_load "vim-matchup" end
    },
    {
        "max397574/better-escape.nvim",
        event = "InsertCharPre",
        config = function() require("better_escape").setup({}) end,
    },
    {
        "rafamadriz/friendly-snippets",
        module = "cmp_nvim_lsp",
        event = "InsertEnter"
    },
    {
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        config = function() require('plugins.config.nvim-cmp') end,
    },
    {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function() require('plugins.config.luasnip') end
    },
    {
        "saadparwaiz1/cmp_luasnip",
        after = "LuaSnip"
    },
    {
        "hrsh7th/cmp-nvim-lua",
        after = "cmp_luasnip"
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        after = "cmp-nvim-lua"
    },
    {
        "hrsh7th/cmp-buffer",
        after = "cmp-nvim-lsp"
    },
    {
        "hrsh7th/cmp-path",
        after = "cmp-buffer"
    },
    {
        'mhinz/vim-startify',
        setup = function() mappings.startify() end
    },
    {
        "kyazdani42/nvim-tree.lua",
        after = "nvim-web-devicons",
        cmd = {"NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle"},
        setup = function() mappings.nvimtree() end,
        config = function() require('plugins.config.nvim-tree') end
    },
    {
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        setup = function() mappings.telescope() end
    },
    {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        cmd = "Trouble",
        setup = function() mappings.trouble() end,
        config = function() require('trouble').setup({}) end
    },
    {
        'akinsho/toggleterm.nvim',
        cmd = "ToggleTerm",
        setup = function() mappings.toggleterm() end,
        config = function() require('plugins.config.toggleterm') end
    },
    {
        'folke/which-key.nvim',
        opt = true,
        keys="<space>",
        config = function() require('plugins.config.which-key') end
    },
    {
        'danymat/neogen',
        cmd = "Neogen",
        setup = function() mappings.neogen() end,
        config = function() require('neogen').setup() end
    },
    {
        "rcarriga/vim-ultest",
        requires = {"vim-test/vim-test"},
        run = ":UpdateRemotePlugins",
        setup = function() mappings.ultest() end,
    }
}

return packer.startup(function(use)
   for _, v in pairs(plugins) do
      use(v)
   end
end)

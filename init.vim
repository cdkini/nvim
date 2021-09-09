let mapleader=" "
set nocompatible

" Source this file upon startup
autocmd VimEnter * source $HOME/.config/nvim/init.vim

" =====================================================================================================================
"                                                       DEFAULTS
" =====================================================================================================================
 
" OPTIONS:
  source $HOME/.config/nvim/settings/general/options.vim

" GENERAL REMAPS:
  source $HOME/.config/nvim/settings/general/remaps.vim

" HELPER FUNCTIONS:
  source $HOME/.config/nvim/settings/general/helpers.vim

" TERMINAL SETTINGS:
  source $HOME/.config/nvim/settings/general/terminal.vim

" =====================================================================================================================
"                                                       PLUGINS
" =====================================================================================================================

" PLUGIN IMPORTS:
call plug#begin('$HOME/.config/nvim/plugged')

    " THEME:
        Plug 'glepnir/galaxyline.nvim'                              " Lightweight statusline  [plugins/theme/galaxyline.vim]
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " v0.5.0 color support    [plugins/theme/treesitter.vim]
        Plug 'EdenEast/nightfox.nvim'

    " CODE:
        Plug 'ahmedkhalf/lsp-rooter.nvim'                           " Auto chdir using LSP
        Plug 'folke/trouble.nvim'                                   " Better diagnostics
        Plug 'hrsh7th/nvim-compe'                                   " LSP completion          [plugins/code/compe.vim]
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " Fuzzy finding           [plugins/code/fzf.vim]
        Plug 'junegunn/fzf.vim'
        Plug 'lewis6991/gitsigns.nvim'                              " Cleaner git gutters     [plugins/code/gitsigns.vim]
        Plug 'mbbill/undotree'                                      " Undo tree               [plugins/code/undotree.vim]
        Plug 'neovim/nvim-lspconfig'                                " v0.5.0 LSP!             [plugins/code/lspconfig.vim]
        Plug 'nvim-lua/plenary.nvim'                                " Gitsigns helper funcs
        Plug 'kyazdani42/nvim-tree.lua'                             " File explorer           [plugins/code/nvim-tree.vim]
        Plug 'romgrk/barbar.nvim'                                   " Improved buffers        [plugins/code/barbar.vim]
        Plug 'tpope/vim-fugitive'                                   " Git goodness
        Plug 'tpope/vim-rhubarb'                                    " GitHub goodness
        Plug 'tpope/vim-commentary'                                 " Comment out
        Plug 'tpope/vim-eunuch'                                     " UNIX file operations
        Plug 'tpope/vim-repeat'                                     " Improved . support
        Plug 'tpope/vim-surround'                                   " Surround editing
        Plug 'kshenoy/vim-signature'                                " Marks in gutter
        Plug 'tversteeg/registers.nvim'

    " MISC:
        Plug 'liuchengxu/vim-which-key'                             " Key previews            [plugins/misc/whichkey.vim]
        Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
        Plug 'machakann/vim-highlightedyank'                        " Highlight yanks         [plugins/misc/highlightedyank.vim]
        Plug 'mhinz/vim-startify'                                   " Dashboard               [plugins/misc/startify.vim]
        Plug 'szw/vim-maximizer'                                    " Zoom in/out of buffer   [plugins/misc/maximizer.vim]
        Plug 'yuttie/comfortable-motion.vim'                        " Smooth scrolling        [plugins/misc/comfortable-motion.vim]

        Plug 'tweekmonster/startuptime.vim'                         " Performance measurement


call plug#end()


" PLUGIN SETTINGS:
  " THEME:
     source $HOME/.config/nvim/settings/plugins/theme/galaxyline.vim
     source $HOME/.config/nvim/settings/plugins/theme/treesitter.vim

  " CODE:
     source $HOME/.config/nvim/settings/plugins/code/barbar.vim
     source $HOME/.config/nvim/settings/plugins/code/compe.vim
     source $HOME/.config/nvim/settings/plugins/code/fzf.vim
     source $HOME/.config/nvim/settings/plugins/code/gitsigns.vim
     source $HOME/.config/nvim/settings/plugins/code/lspconfig.vim
     source $HOME/.config/nvim/settings/plugins/code/nvim-tree.vim
     source $HOME/.config/nvim/settings/plugins/code/undotree.vim

  " MISC:
     source $HOME/.config/nvim/settings/plugins/misc/comfortable-motion.vim
     source $HOME/.config/nvim/settings/plugins/misc/highlightedyank.vim
     source $HOME/.config/nvim/settings/plugins/misc/maximizer.vim
     source $HOME/.config/nvim/settings/plugins/misc/startify.vim
     source $HOME/.config/nvim/settings/plugins/misc/whichkey.vim

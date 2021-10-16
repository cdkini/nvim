" configure treesitter
:lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "python", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}

-- local nightfox = require('nightfox')
-- nightfox.setup({fox="nordfox"})
-- nightfox.load()
EOF

syntax enable
set termguicolors

let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material


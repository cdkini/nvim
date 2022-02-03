local toggleterm = require('toggleterm')
local api = vim.api

toggleterm.setup{
  direction = 'float'
}

api.nvim_set_keymap('n', '<C-\\>', '<cmd>ToggleTerm<CR>', { noremap = true})

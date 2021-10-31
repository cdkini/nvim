local api = vim.api

api.nvim_set_keymap('n', '<leader>bp', ':BufferPrevious<cr>', { noremap = true } )
api.nvim_set_keymap('n', '<leader>bn', ':BufferNext<cr>', { noremap = true } )
api.nvim_set_keymap('n', '<leader>bd', ':BufferClose<cr>', { noremap = true } )
api.nvim_set_keymap('n', '<leader>bb', ':BufferPick<cr>', { noremap = true } )


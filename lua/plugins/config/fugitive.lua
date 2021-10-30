local api = vim.api

api.nvim_set_keymap('n', '<leader>gg', '<cmd>Git<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>gb', '<cmd>Git blame<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>gl', '<cmd>Git log<cr>', { noremap = true})

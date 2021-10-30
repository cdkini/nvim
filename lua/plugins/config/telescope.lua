local api = vim.api

api.nvim_set_keymap('n', '<leader>sf', '<cmd>lua require"telescope.builtin".find_files()<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>sp', '<cmd>lua require"telescope.builtin".live_grep()<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>s/', '<cmd>lua require"telescope.builtin".current_buffer_fuzzy_find()<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>sb', '<cmd>lua require"telescope.builtin".buffers()<cr>', { noremap = true})

api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require"telescope.builtin".git_bcommits()<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>gC', '<cmd>lua require"telescope.builtin".git_commits()<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"telescope.builtin".git_branches()<cr>', { noremap = true})


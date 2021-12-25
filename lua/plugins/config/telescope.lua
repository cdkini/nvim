local api = vim.api

api.nvim_set_keymap('n', '<leader>sf', '<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>sp', '<cmd>lua require"telescope.builtin".live_grep(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>s/', '<cmd>lua require"telescope.builtin".current_buffer_fuzzy_find(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>sb', '<cmd>lua require"telescope.builtin".buffers(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})

api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require"telescope.builtin".git_bcommits(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>gC', '<cmd>lua require"telescope.builtin".git_commits(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})
api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"telescope.builtin".git_branches(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})

api.nvim_set_keymap('n', '<leader>b/', '<cmd>lua require"telescope.builtin".buffers(require("telescope.themes").get_ivy({}))<cr>', { noremap = true})

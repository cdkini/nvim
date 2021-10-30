local api = vim.api

require('gitsigns').setup({
  keymaps = {
    ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
  }
})


api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"telescope.builtin".git_branches()<cr>', { noremap = true})

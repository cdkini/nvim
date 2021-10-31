local api = vim.api

require('nvim-tree').setup({
  disable_netrw = false,
  view = {
      width = 50
  },
  update_cwd = true,
  hijack_cursor = true,
  update_focused_file = {
      enable = true   
  }
})

api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', { noremap = true})

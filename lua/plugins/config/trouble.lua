require('trouble')

vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})

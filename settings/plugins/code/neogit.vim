:lua << EOF

require("neogit").setup {
    integrations = {
        diffview = true
    }
}

require("gitlinker").setup()

EOF

nnoremap <leader>gg :Neogit<CR>
nnoremap <leader>gc :Neogit commit<CR>
nnoremap <leader>gl :Neogit log<CR>

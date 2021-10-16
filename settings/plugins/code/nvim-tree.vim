lua<<EOF

require'nvim-tree'.setup {
    disable_netrw = false,
    view = {
        width = 50
    },
    update_cwd = true,
    hijack_cursor = true,
    update_focused_file = {
        enable = true   
    }
}

EOF
let g:nvim_tree_show_icons = {'folders': 0}
" let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_follow = 1
nnoremap <leader>e :NvimTreeToggle<CR>

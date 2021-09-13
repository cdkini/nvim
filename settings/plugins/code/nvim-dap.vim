:lua << EOF

require('dap-python').setup('~/.config/nvim/debugpy/bin/python3')
require('dap-python').test_runner = 'pytest'
require('dapui').setup()


EOF

nnoremap <silent><leader>db :lua require"dap".toggle_breakpoint()<CR>
nnoremap <silent><leader>dk :lua require"dap".step_out()<CR>
nnoremap <silent><leader>dl :lua require"dap".step_into()<CR>
nnoremap <silent><leader>dj :lua require"dap".step_over()<CR>
nnoremap <silent><leader>dh :lua require"dap".continue()<CR>
nnoremap <silent><leader>du :lua require"dap".up()<CR>
nnoremap <silent><leader>dd :lua require"dap".down()<CR>
nnoremap <silent><leader>dq :lua require"dap".disconnect({ terminateDebuggee = true });require"dap".close()<CR>
nnoremap <silent><leader>dt :lua require('dap-python').test_method()<CR>

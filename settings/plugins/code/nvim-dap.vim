:lua << EOF

require('dap-python').setup('~/.config/nvim/debugpy/bin/python3')
require('dap-python').test_runner = 'pytest'

EOF

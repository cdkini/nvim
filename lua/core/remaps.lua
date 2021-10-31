local api = vim.api

-- Use Ctrl + hjkl to move to a split or create a new one if one doesn't exist in that direction
api.nvim_exec(
[[
  function! WinMove(key)
      let t:curwin = winnr()
      exec "wincmd ".a:key
      if (t:curwin == winnr())
          if (match(a:key,'[jk]'))
              wincmd v
          else
              wincmd s
          endif
          exec "wincmd ".a:key
      endif
  endfunction
]], true)

api.nvim_set_keymap('n', '<C-h>', ':call WinMove("h")<CR>', { noremap = true})
api.nvim_set_keymap('n', '<C-j>', ':call WinMove("j")<CR>', { noremap = true})
api.nvim_set_keymap('n', '<C-k>', ':call WinMove("k")<CR>', { noremap = true})
api.nvim_set_keymap('n', '<C-l>', ':call WinMove("l")<CR>', { noremap = true})

-- Source/open init.lua
api.nvim_set_keymap('n', '<leader>vs', ':luafile $MYVIMRC<CR>', { noremap = true})
api.nvim_set_keymap('n', '<leader>ve', ':e $MYVIMRC<CR>', { noremap = true})
api.nvim_set_keymap('n', '<leader>vi', ':PackerInstall<CR>', { noremap = true})
api.nvim_set_keymap('n', '<leader>vc', ':PackerCompile<CR>', { noremap = true})
api.nvim_set_keymap('n', '<leader>vd', ':PackerClean<CR>', { noremap = true})
api.nvim_set_keymap('n', '<leader>vu', ':PackerUpdate<CR>', { noremap = true})

-- cd to current buffer
api.nvim_set_keymap('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true })

-- Treat Y like C or D (goes to EOL)
api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})

-- Align splits
api.nvim_set_keymap('n', '<leader>=', '<C-w>=', { noremap = true})

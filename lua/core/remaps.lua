local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Use Ctrl + hjkl to move to a split or create a new one if one doesn't exist in that direction
vim.api.nvim_exec(
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

keymap('n', '<C-h>', ':call WinMove("h")<CR>', opts)
keymap('n', '<C-j>', ':call WinMove("j")<CR>', opts)
keymap('n', '<C-k>', ':call WinMove("k")<CR>', opts)
keymap('n', '<C-l>', ':call WinMove("l")<CR>', opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Source/open init.lua
keymap('n', '<leader>vs', ':PackerSync<CR>', opts)
keymap('n', '<leader>ve', ':e $MYVIMRC<CR>', opts)
keymap('n', '<leader>vi', ':PackerInstall<CR>', opts)
keymap('n', '<leader>vc', ':PackerCompile<CR>', opts)
keymap('n', '<leader>vd', ':PackerClean<CR>', opts)
keymap('n', '<leader>vu', ':PackerUpdate<CR>', opts)

-- cd to current buffer
keymap('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', opts)

-- Align splits
keymap('n', '<leader>=', '<C-w>=', opts)

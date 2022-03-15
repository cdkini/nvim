vim.api.nvim_exec([[
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

local opts = {noremap = true, silent = true}
local M = {}

M.core = function()
    -- Use Ctrl + hjkl to move to a split or create a new one if one doesn't exist in that direction
    vim.api.nvim_set_keymap('n', '<C-h>', ':call WinMove("h")<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-j>', ':call WinMove("j")<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-k>', ':call WinMove("k")<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-l>', ':call WinMove("l")<CR>', opts)

    -- Resize with arrows
    vim.api.nvim_set_keymap("n", "<C-Up>", ":resize -2<CR>", opts)
    vim.api.nvim_set_keymap("n", "<C-Down>", ":resize +2<CR>", opts)
    vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
    vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

    -- cd to current buffer
    vim.api.nvim_set_keymap('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', opts)

    -- Align splits
    vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', opts)

    -- Exit terminal
    vim.api.nvim_set_keymap('t', 'jk', ':<C-\\><C-n>', opts)
    vim.api.nvim_set_keymap('t', 'kj', ':<C-\\><C-n>', opts)

    -- Clear search highlighting
    vim.api.nvim_set_keymap('n', '<Esc>', ':nohl<CR>', opts)

    -- Don't copy the replaced text after pasting in visual mode
    vim.api.nvim_set_keymap("v", "p", "p:let @+=@0<CR>", opts)

    -- Source/open init.lua
    vim.api.nvim_set_keymap('n', '<leader>vs', ':PackerSync<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>ve', ':e $MYVIMRC<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vi', ':PackerInstall<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vc', ':PackerCompile<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vd', ':PackerClean<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>vu', ':PackerUpdate<CR>', opts)
end

M.maximizer = function()
    vim.api.nvim_set_keymap('n', '<leader>z', ':MaximizerToggle<cr>', opts)
end

M.barbar = function()
    vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferNext<cr>', opts)
    vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferPrevious<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferClose<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bD', ':BufferCloseAllButCurrent<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>bb', ':BufferPick<cr>', opts)
end

M.fugitive = function()
    vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Git<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Git blame<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>Git log<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>gh', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', opts)
    vim.api.nvim_set_keymap('v', '<leader>gh', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', opts)
end


M.startify = function()
    vim.api.nvim_set_keymap('n', '<leader>;', ':Startify<cr>', opts)
end

M.nvimtree = function()
    vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', opts)
end

M.telescope = function()
    vim.api.nvim_set_keymap('n', '<leader>sf', '<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>sp', '<cmd>lua require"telescope.builtin".live_grep(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>s/', '<cmd>lua require"telescope.builtin".current_buffer_fuzzy_find(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>sb', '<cmd>lua require"telescope.builtin".buffers(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>lua require"telescope.builtin".git_bcommits(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>gC', '<cmd>lua require"telescope.builtin".git_commits(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"telescope.builtin".git_branches(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>b/', '<cmd>lua require"telescope.builtin".buffers(require("telescope.themes").get_ivy({}))<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"telescope.builtin".git_branches()<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>sr', '<cmd>lua require"telescope.builtin".resume()<cr>', opts)
end

M.trouble = function()
    vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>Trouble document_diagnostics<cr>", opts)
end

M.toggleterm = function()
    vim.api.nvim_set_keymap('n', '<C-\\>', '<cmd>ToggleTerm<CR>', opts)
end

M.neogen = function()
    vim.api.nvim_set_keymap('n', '<leader>af', '<cmd>Neogen func<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>ac', '<cmd>Neogen class<CR>', opts)
end

M.ultest = function()
    vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>UltestNearest<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>Ultest<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>UltestClear<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>UltestLast<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>UltestSummary<CR>', opts)
end

return M

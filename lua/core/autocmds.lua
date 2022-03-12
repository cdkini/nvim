-- Highlighted yanks
vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400} ]]

-- Remove whitespace on save
vim.cmd [[ au BufWritePre * :%s/\s\+$//e ]]

-- Don't auto commenting new lines
vim.cmd [[ au BufEnter * set fo-=c fo-=r fo-=o]]

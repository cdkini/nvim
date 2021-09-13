" GENERAL REMAPS:
" {{{
  " Remap <Esc>
  " inoremap jk <Esc>
  " inoremap kj <Esc>

  " Navigate and create splits
  nnoremap <silent> <C-h> :call WinMove('h')<CR>
  nnoremap <silent> <C-j> :call WinMove('j')<CR>
  nnoremap <silent> <C-k> :call WinMove('k')<CR>
  nnoremap <silent> <C-l> :call WinMove('l')<CR>

  " Source/open vimrc
  nnoremap <leader>vs :source $MYVIMRC<CR>
  nnoremap <leader>ve :e $HOME/.config/nvim/init.vim<CR>
  nnoremap <leader>vi :PlugInstall<CR>
  nnoremap <leader>vc :PlugClean<CR>

  " cd to current buffer
  nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

  " Treat Y like C or D (goes to EOL)
  nnoremap Y y$

" }}}

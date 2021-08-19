" TERMINAL SETTINGS:
" {{{
  " To map <Esc> to exit terminal-mode
  tnoremap <Esc> <C-\><C-n>

  " Something
  let g:term_buf=0
  let g:term_win=0

  " Open integrated terminal at bottom of buffer
  nnoremap <silent> <leader>tt :call TermToggle(10)<CR>

  " Start terminal in insert mode
  " au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" }}}

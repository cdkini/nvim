" Leader Key Maps

nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Timeout
let g:which_key_timeout = 50

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

let g:which_key_map =  {}
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


let g:which_key_map[';'] = [ ':Startify'            , 'dashboard' ]
let g:which_key_map['='] = [ '<C-w>='               , 'align splits' ]
let g:which_key_map['z'] = [':MaximizerToggle'      , 'zoom in/out']

let g:which_key_map.h = 'which_key_ignore'
let g:which_key_map.j = 'which_key_ignore'
let g:which_key_map.k = 'which_key_ignore'
let g:which_key_map.l = 'which_key_ignore'
let g:which_key_map['T'] = { 'name': 'which_key_ignore' }
let g:which_key_map['q'] = { 'name': 'which_key_ignore' }
let g:which_key_map['w'] = { 'name': 'which_key_ignore' }
let g:which_key_map['c'] = { 'name': 'which_key_ignore' }
let g:which_key_map['r'] = { 'name': 'which_key_ignore' }

" Group mappings

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '>' : [':BufferMoveNext'                    , 'move next'],
      \ '<' : [':BufferMovePrevious'                , 'move prev'],
      \ 'b' : [':BufferPick'                        , 'pick'],
      \ 'D' : [':BufOnly'                           , 'delete others'],
      \ 'd' : [':BufferClose'                       , 'delete current'],
      \ '?' : ['Buffers'                            , 'list'],
      \ }

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'b':  ['<cmd>lua require"gitsigns".blame_line()<CR>'                        , 'blame'],
      \ 'c':  [':Neogit commit'                                                     , 'commit'],
      \ 'g':  [':Neogit'                                                            , 'status'],
      \ 'l':  [':Neogit log'                                                        , 'log'],
      \ 'y':  ['<cmd>lua require."gitlinker".get_buf_range_url("n")'                , 'yank url'],
      \ 'p':  ['<cmd>lua require"gitsigns".preview_hunk<CR>'                        , 'which_key_ignore'],
      \ 'r':  ['<cmd>lua require"gitsigns".reset_hunk()'                            , 'which_key_ignore'],
      \ 'R':  ['<cmd>lua require"gitsigns".reset_buffer()'                          , 'which_key_ignore'],
      \ 's':  ['<cmd>lua require"gitsigns".stage_hunk()<CR>'                        , 'which_key_ignore'],
      \ 'u':  ['<cmd>lua require"gitsigns".undo_stage_hunk()<CR>'                   , 'which_key_ignore'],
      \ }

" s is for search 
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'cmd history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'p' : [':Rg'           , 'project'],
      \ }

" t is for toggle
let g:which_key_map.t = {
      \ 'name' : '+toggle' ,
      \ 'd' : [':TroubleToggle lsp_document_diagnostics'                  , 'diagnostics'],
      \ 't' : [':call TermToggle(10)'                                     , 'terminal'],
      \ 'u' : [':UndoTreeToggle'                                          , 'undotree'],
      \ 'e' : [':NvimTreeToggle'                                          , 'explorer'],
      \ }

" v is for vim
let g:which_key_map.v = {
      \ 'name' : '+vim' ,
      \ 'e' : [':e $HOME/.config/nvim/init.vim'      , 'edit'],
      \ 's' : [':source $MYVIMRC'                       , 'source'],
      \ 'i' : [':PlugInstall'                           , 'install'],
      \ 'c' : [':PlugClean'                             , 'clean'],
      \ }

" call which_key#register('<Space>', "g:which_key_map")
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

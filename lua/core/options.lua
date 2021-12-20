local opt = vim.opt


opt.autoindent = true                                      -- Aids with autoindenting
opt.backup = false                                         -- Backup files 
opt.bg = 'dark'                                            -- Color scheme
opt.clipboard = 'unnamedplus'                              -- Copy paste between nvim and everything else
opt.cmdheight = 1                                          -- Give more space for displaying messages
opt.colorcolumn = '88'                                     -- Sets ruler
opt.completeopt = {'menuone', 'noinsert', 'noselect'}      -- nvim LSP
opt.cursorline = true                                      -- Highlight current line
opt.errorbells= false                                      -- No annoying noise 
opt.expandtab = true                                       -- Uses appropriate number of spaces to insert a <Tab> in insert mode
opt.fileencoding = 'utf-8'                                 -- The encoding written to a file
opt.formatoptions:remove('cro')                            -- Stop newline continuation of comments
opt.hlsearch = false                                       -- Remove highlighting after search
opt.ignorecase = true                                      -- Ignores case used in search query
opt.incsearch = true                                       -- Highlights search results as a search query is typed
opt.mouse = 'a'                                            -- Use mouse to navigate
opt.number = true                                          -- Sets line numbering
opt.relativenumber = true                                  -- Sets relative numbering for easy traversal
opt.scrolloff = 10                                         -- Improved view while scrolling
opt.shiftwidth = 4                                         -- Number of spaces used for each step of autoindent
opt.shortmess:append('c')                                  -- nvim LSP
opt.smartcase = true                                       -- Disables ignorecase if any caps are used in search query
opt.smartindent = true                                     -- Aids with autoindenting
opt.smarttab = true                                        -- <Tab> at start of a line inserts blanks to match surrounding code
opt.softtabstop = 4                                        -- Number of spaces a <Tab> counts for while performing edits
opt.splitbelow = true  			                           -- Horizontal splits will automatically be below
opt.swapfile = false                                       -- Prevents creation of .swp files, which store changes made to buffers
opt.tabstop = 4                                            -- Number of spaces a <Tab> is equivalent to
opt.termguicolors = true                                   -- Enables certain visuals
opt.timeoutlen = 100                                       -- Time for a mapped sequence to complete (default is 1000ms)
opt.title = true                                           -- Set filename as title
opt.undodir = '.undodir'                                   -- Write undofiles to dir
opt.undofile = true                                        -- Enable undofiles
opt.updatetime = 100                                       -- Faster completion
opt.wrap = false                                           -- Display long lines as just one line

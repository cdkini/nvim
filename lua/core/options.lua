local opt = vim.opt

opt.splitbelow = true  			                         -- Horizontal splits will automatically be below
opt.errorbells= false                                      -- No annoying noise 
opt.cmdheight = 2                                          -- Give more space for displaying messages
opt.tabstop = 4                                            -- Number of spaces a <Tab> is equivalent to
opt.softtabstop = 4                                        -- Number of spaces a <Tab> counts for while performing edits
opt.shiftwidth = 4                                         -- Number of spaces used for each step of autoindent
opt.expandtab = true                                       -- Uses appropriate number of spaces to insert a <Tab> in insert mode
opt.smarttab = true                                        -- <Tab> at start of a line inserts blanks to match surrounding code
opt.autoindent = true                                      -- Aids with autoindenting
opt.smartindent = true                                     -- Aids with autoindenting
opt.number = true                                          -- Sets line numbering
opt.relativenumber = true                                  -- Sets relative numbering for easy traversal
opt.wrap = false                                           -- Display long lines as just one line
opt.ignorecase = true                                      -- Ignores case used in search query
opt.smartcase = true                                       -- Disables ignorecase if any caps are used in search query
opt.swapfile = false                                       -- Prevents creation of .swp files, which store changes made to buffers
opt.updatetime = 100                                       -- Faster completion
opt.timeoutlen = 500                                       -- Time for a mapped sequence to complete (default is 1000ms)
opt.formatoptions:remove('cro')                            -- Stop newline continuation of comments
opt.clipboard = 'unnamedplus'                              -- Copy paste between nvim and everything else
opt.incsearch = true                                       -- Highlights search results as a search query is typed
opt.colorcolumn = '88'                                     -- Sets ruler
opt.bg = 'dark'                                            -- Color scheme
opt.hlsearch = false                                       -- Remove highlighting after search
opt.scrolloff = 10                                         -- Improved view while scrolling
opt.termguicolors = true                                   -- Enables certain visuals
opt.completeopt = {'menuone', 'noinsert', 'noselect'}      -- nvim LSP
opt.shortmess:append('c')                                  -- nvim LSP
opt.title = true                                           -- Set filename as title

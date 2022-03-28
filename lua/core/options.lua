vim.opt.autoindent = true -- Aids with autoindenting
vim.opt.backup = false -- Backup files
vim.opt.bg = 'dark' -- Color scheme
vim.opt.clipboard = 'unnamedplus' -- Copy paste between nvim and everything else
vim.opt.cmdheight = 1 -- Give more space for displaying messages
vim.opt.colorcolumn = '88' -- Sets ruler
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'} -- nvim LSP
vim.opt.cursorline = true -- Highlight current line
vim.opt.errorbells = false -- No annoying noise
vim.opt.expandtab = true -- Uses appropriate number of spaces to insert a <Tab> in insert mode
vim.opt.fileencoding = 'utf-8' -- The encoding written to a file
vim.opt.formatoptions:remove('cro') -- Stop newline continuation of comments
vim.opt.ignorecase = true -- Ignores case used in search query
vim.opt.incsearch = true -- Highlights search results as a search query is typed
vim.opt.mouse = 'a' -- Use mouse to navigate
vim.opt.number = true -- Sets line numbering
vim.opt.relativenumber = true -- Sets relative numbering for easy traversal
vim.opt.scrolloff = 10 -- Improved view while scrolling
vim.opt.shiftwidth = 4 -- Number of spaces used for each step of autoindent
vim.opt.shortmess:append('c') -- nvim LSP
vim.opt.showmode = false -- Disable modal status (i.e. -- INSERT -- )
vim.opt.smartcase = true -- Disables ignorecase if any caps are used in search query
vim.opt.smartindent = true -- Aids with autoindenting
vim.opt.smarttab = true -- <Tab> at start of a line inserts blanks to match surrounding code
vim.opt.softtabstop = 4 -- Number of spaces a <Tab> counts for while performing edits
vim.opt.splitbelow = true -- Horizontal splits will automatically be below
vim.opt.swapfile = false -- Prevents creation of .swp files, which store changes made to buffers
vim.opt.tabstop = 4 -- Number of spaces a <Tab> is equivalent to
vim.opt.termguicolors = true -- Enables certain visuals
vim.opt.timeoutlen = 300 -- Time for a mapped sequence to complete (default is 1000ms)
vim.opt.title = true -- Set filename as title
vim.opt.undodir = '/Users/cdkini/.config/nvim/.undodir' -- Write undofiles to dir
vim.opt.undofile = true -- Enable undofiles
vim.opt.updatetime = 100 -- Faster completion
vim.opt.wrap = false -- Display long lines as just one line

local disabled_built_ins = {
    "2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat",
    "netrwPlugin", "netrwSettings", "netrwFileHandlers", "matchit", "tar",
    "tarPlugin", "rrhelper", "spellfile_plugin", "vimball", "vimballPlugin",
    "zip", "zipPlugin"
}

for _, plugin in pairs(disabled_built_ins) do vim.g["loaded_" .. plugin] = 1 end

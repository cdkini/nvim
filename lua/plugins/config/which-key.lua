local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

local presets = require("which-key.plugins.presets")

local setup = {
  plugins = {
    marks = true,
    registers = true,
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    }
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  ignore_missing = true,
  layout = {
    align = "center",
  }
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  [';'] = 'Dashboard',
  ['='] = 'Align splits',
  a = {
    name = 'Annotate',
    f = 'Function',
    c = 'Class',
  },
  b = {
    name = 'Buffers',
    b = 'Pick',
    p = 'Previous',
    n = 'Next',
    d = 'Close',
    D = 'Close others',
    ['/'] = 'Search',
  },
  d = 'Diagnostics',
  e = 'Explorer',
  g = {
    name = 'Git',
    b = { 'Blame' },
    B = { 'Branches' },
    c = { 'Commits (Buffer)' },
    C = { 'Commits (Project)' },
    g = { 'Status' },
    h = { 'GitHub' },
    l = { 'Log' },
    s = { 'Stage hunk' },
    u = { 'Undo stage hunk' },
    r = { 'Reset hunk' },
    p = { 'Preview hunk' },
  },
  s = {
    name = 'Search',
    b = 'Buffers',
    f = 'Files',
    p = 'Project',
    r = 'Resume',
    ['/'] = 'Current file',
  },
  t = {
    name = 'Test',
    c = 'Clear',
    f = 'File',
    l = 'Last',
    s = 'Summary',
    t = 'Test'
  },
  v = {
    name = 'Vim',
    c = { 'Compile' },
    d = { 'Delete' },
    e = { 'Edit' },
    i = { 'Install' },
    s = { 'Sync' },
    u = { 'Update' },
  },
  w = {
    name = 'Wiki',
    d = { 'Delete' },
    n = { 'New' },
    r = { 'Rename' },
    t = { 'Today' },
    w = { 'Index' },
  },
  z = 'Zoom',
}

which_key.setup(setup)
which_key.register(mappings, opts)

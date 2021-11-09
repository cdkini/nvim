local wk = require('which-key')

wk.setup({
  plugins = {
    marks = true,
    registers = true,
  },
  presets = {
    operators = false,
    motions = false,
    text_objects = false,
    windows = false,
    nav = false,
    z = false,
    g = false,
  },
  ignore_missing = true,
  layout = {
    align = "center",
  }
})

wk.register({
  [';'] = 'Dashboard',
  ['='] = 'Align splits',
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
    ['/'] = 'Current file',
  },
  v = {
    name = 'Vim',
    c = { 'Compile' },
    d = { 'Delete' },
    e = { 'Edit' },
    i = { 'Install' },
    s = { 'Source' },
    u = { 'Update' },
  },
}, { prefix = '<leader>' })


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
  ignore_missing = false,
  layout = {
    align = "center",
  }
})

wk.register({
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


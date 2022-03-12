local ok, nvimtree = pcall(require, 'nvim-tree')
if not ok then
	return
end

nvimtree.setup({
  disable_netrw = false,
  view = {
      width = 50
  },
  update_cwd = true,
  hijack_cursor = true,
  update_focused_file = {
      enable = true
  }
})

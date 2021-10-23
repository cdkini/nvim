local present, catppuccino = pcall(require, "catppuccino")
if not present then
	return
end

require(catppuccino).setup({
  colorscheme = 'soft_manilo'
})

vim.cmd[[colorscheme catppuccino]]

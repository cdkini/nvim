require('nvim-treesitter.configs').setup({
  ensure_installed = { "bash", "dockerfile", "graphql", "javascript", "json", "lua", "python", "typescript", "yaml" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
})

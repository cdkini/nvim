local ok, luasnip = pcall(require, "luasnip")
if not ok then
    return
end

local config = {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}
luasnip.config.set_config(config)
require("luasnip/loaders/from_vscode").load()

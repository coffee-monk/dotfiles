local status, luasnip = pcall(require, "luasnip")
if not status then
	return
end

-- load snippets from directory ---------------------------

local snippet_dir = "~/.config/nvim/lua/plugins/luasnip/snippets/"
require("luasnip.loaders.from_lua").load({ paths = snippet_dir })

-- Config -------------------------------------------------

luasnip.config.set_config({
	history = false,
	update_events = "TextChanged,TextChangedI",
	delete_check_events = "TextChanged",
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

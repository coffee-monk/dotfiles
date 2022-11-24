-- LUASNIPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local ls = require("luasnip")

local filetype = "lua"

-- Snippet Nodes
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Add Snippets -------------------------------------------

local snippets = {

	-- local
	s("local", fmt([[ local {} = {}  ]], { i(1, ""), i(0, "") })),
}

-- add_snippets() end -------------------------------------
ls.add_snippets(filetype, snippets, { key = filetype })

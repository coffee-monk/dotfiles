-- LUASNIPS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local ls = require("luasnip")

local filetypes = { "typescript", "typescriptreact", "tsx" }

-- Snippet Nodes
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Add Snippets -------------------------------------------

local snippets = {

	-- console.log()
	s("cl", fmt([[ console.log({})  ]], { i(0, "") })),
}

-- load & extend snippets for each filetype ---------------

for _, filetype in pairs(filetypes) do
	ls.add_snippets(filetype, snippets, { key = filetype }) -- load
	ls.filetype_extend(filetype, { "javascript" }) -- extend
end

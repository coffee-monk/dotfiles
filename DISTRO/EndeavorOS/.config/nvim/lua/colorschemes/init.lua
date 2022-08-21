-- Colorschemes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local themes = {
	{ "Nightfox", "nightfox" },
	{ "Nordfox", "nordfox" },
	{ "Duskfox", "duskfox" },
	{ "Terafox", "terafox" },
	{ "Dayfox", "dayfox" },
	{ "Tokyonight", "tokyonight" },
	{ "Monokai", "monokai_pro" },
	{ "Boo", "boo" },
	{ "Jellybeans", "jellybeans-nvim" },
	{ "Sonokai", "sonokai" },
	{ "Solarized", "solarized" },
	{ "Synthwave84", "synthwave84" },

	{ "Nord", { theme = "nord", lua_loc = "lualine.themes.nord" } },
	{ "Dark", { theme = "vscode", lua_loc = "lualine.themes.vscode" } },
	{ "Moonlight", { theme = "moonlight", lua_loc = "lualine.themes.moonlight" } },
	{ "Melange", { theme = "melange", lua_loc = "lualine.themes.gruvbox" } },
	{ "Gruvbox", { theme = "gruvbox", lua_loc = "lualine.themes.gruvbox" } },
	{ "Everforest", { theme = "everforest", lua_loc = "lualine.themes.everforest" } },
	{ "Blush", { theme = "everblush", lua_loc = "lualine.themes.everblush" } },
	{ "Marakai", { theme = "marakai", lua_loc = "colorschemes.marakai_lualine" } },
}

-- create cmds from themes (colorscheme + lualine)
local colo_command = require("colorschemes.set_colo_cmd")

for _, theme in pairs(themes) do
	pcall(colo_command, theme[1], theme[2]) -- (name, {colorscheme, lualine_folder})
end

-- Colorscheme Configs ------------------------------------

-- Remove SignColumn background + carats in StatusLine
vim.cmd([[
  autocmd Colorscheme * highlight SignColumn guibg=NONE | highlight StatusLine gui=bold | highlight LineNr guibg=NONE | highlight StatusLineNC gui=italic
]])

vim.o.background = "dark"

-- Sonokai
vim.cmd([[
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
]])

-- Tokyonight
vim.g.tokyonight_style = "night"

-- VSCode Dark
local status, vscode = pcall(require, "vscode")
if status then
	vscode.setup({
		transparent = false,
	})
end

-- Startup Colorscheme ------------------------------------

pcall(vim.cmd, ":Marakai")

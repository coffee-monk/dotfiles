-- Colorschemes >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

local themes = {
	{ "Tokyonight", "tokyonight" },

	{ "Nightfox", "nightfox" },
	{ "Nordfox", "nordfox" },
	{ "Terafox", "terafox" },
	{ "DuskFox", "duskfox" },

	{ "Monokai", "monokai_pro" },
	{ "Jellybeans", "jellybeans-nvim" },
	{ "Sonokai", "sonokai" },
	{ "Synthwave84", "synthwave84" },

	{ "XCode", { theme = "xcode", lua_loc = "colorschemes.lualine_themes.xcode" } },

	{ "Gruvbox", { theme = "gruvbox", lua_loc = "lualine.themes.gruvbox" } },
	{ "Dark", { theme = "vscode", lua_loc = "lualine.themes.vscode" } },
	{ "Blush", { theme = "everblush", lua_loc = "lualine.themes.everblush" } },
	{ "Dracula", { theme = "dracula", lua_loc = "lualine.themes.dracula-nvim" } },
	{ "Nord", { theme = "nord", lua_loc = "lualine.themes.nord" } },
	{ "Melange", { theme = "melange", lua_loc = "lualine.themes.gruvbox" } },
	{ "Everforest", { theme = "everforest", lua_loc = "lualine.themes.everforest" } },

	{ "Marakai", { theme = "marakai", lua_loc = "colorschemes.lualine_themes.marakai" } },
	{ "Carbonfox", { theme = "carbonfox", lua_loc = "colorschemes.lualine_themes.carbonfox" } },
	{ "Solarized", { theme = "solarized", lua_loc = "colorschemes.lualine_themes.solarized" } },
	{ "Nightowl", { theme = "nightfly", lua_loc = "colorschemes.lualine_themes.nightowl" } },
  { "Onedark", { theme = "onedark", lua_loc = "colorschemes.lualine_themes.onedark" } },
  { "Boo", { theme = "boo", lua_loc = "colorschemes.lualine_themes.boo" } },
	{ "Moonlight", { theme = "moonlight", lua_loc = "colorschemes.lualine_themes.moonlight" } },
}

-- create cmds from themes (colorscheme + lualine)
local colo_command = require("colorschemes.set_colo_cmd")

for _, theme in pairs(themes) do
	pcall(colo_command, theme[1], theme[2]) -- (name, {colorscheme, lualine_folder})
end

-- Colorscheme Configs ------------------------------------

-- Remove SignColumn background + carats in StatusLine
vim.cmd([[
  autocmd Colorscheme * highlight SignColumn guibg=NONE | highlight StatusLine gui=bold | highlight LineNr guibg=NONE | highlight StatusLineNC gui=italic | set background=dark
]])

-- Sonokai
vim.cmd([[
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
]])

-- Nightfly
vim.cmd([[
let g:nightflyWinSeparator = '2'
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

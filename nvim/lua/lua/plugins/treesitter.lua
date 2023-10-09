return {
	"nvim-treesitter/playground",
	{ "windwp/nvim-ts-autotag", config = true },
	{
		"HiPhish/rainbow-delimiters.nvim",
		cond = true,
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					-- lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterCyan",
					"RainbowDelimiterViolet",
					"RainbowDelimiterRed",
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				ignore_install = { "" }, -- List of parsers to ignore installing
				highlight = {
					enable = true,
					disable = { "" }, -- list of languages to disable
				},
			})
		end,
	},
}

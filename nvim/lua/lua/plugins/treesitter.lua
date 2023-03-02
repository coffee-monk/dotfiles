return {
	"nvim-treesitter/playground",
	"p00f/nvim-ts-rainbow",
	{ "windwp/nvim-ts-autotag", config = true },
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
				rainbow = { -- rainbow parentheses
					enable = true,
					disable = { "html" },
					extended_mode = false, -- highlight non-bracket delimiters like html tags etc
					colors = {
						"#FFFF00",
						"#3BAFF5",
						"#ffd4fe",
						"#bdfcd0",
						"#a8f9ff",
						"#c5c6fc",
					},
					indent = { enable = true, disable = { "python", "css" } },
					max_file_lines = nil, -- Do not enable for files with more than n lines
				},
			})
		end,
	},
}

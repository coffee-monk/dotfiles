local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

configs.setup({
	ensure_installed = "all",
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,
		disable = { "" }, -- list of languages to disable
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
	-- Rainbow parentheses
	rainbow = {
		enable = true,
		disable = { "html", "jsx", "cpp" },
		extended_mode = true, -- highlight non-bracket delimiters like html tags etc
		colors = {
			"#FFFF00",
			"#3BAFF5",
			"#ffd4fe",
			"#bdfcd0",
			"#a8f9ff",
			"#c5c6fc",
		},
		max_file_lines = nil, -- Do not enable for files with more than n lines
	},
})

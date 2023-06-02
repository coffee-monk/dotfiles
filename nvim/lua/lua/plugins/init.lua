-- Plugin Manager (lazy.nvim) >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

return {

	-- Core Plugins -----------------------------------------
	"lambdalisue/suda.vim",
	"chentoast/marks.nvim",
	{
		"0x00-ketsu/maximizer.nvim",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			show_current_context = true,
		},
	}, -- visual indent lines
	{
		"kana/vim-arpeggio",
		init = function()
			pcall(vim.cmd, "let g:arpeggio_timeoutlen = 100")
		end,
	},
	{
		"echasnovski/mini.ai",
		config = function()
			require("mini.ai").setup({
				custom_textobjects = {
					b = { { [[%b'']], [[%b""]], "%b()", "%b[]", "%b{}" }, "^.().*().$" },
					B = { { "%b{}", "%b()", "%b[]" }, "^.().*().$" },
					c = { { "%b()" }, "^.().*().$" },
					C = { { "%b{}" }, "^.().*().$" },
				},
			})
		end,
	},

	-- Navigation -------------------------------------------
	{ "petertriho/nvim-scrollbar", config = true },
	{
		"stevearc/oil.nvim",
		opts = {
			float = {
				padding = 1,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 12,
				},
			},
			win_options = {
				signcolumn = "no",
				cursorcolumn = false,
				list = true,
			},
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<CR>"] = "actions.select",
				["<S-CR>"] = "actions.parent",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "v2.*",
		opts = {
			options = {
				separator_style = { "" },
				indicator = {
					icon = " ",
					style = "icon",
				},
				offsets = {
					{
						filetype = "NvimTree",
						text = "",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	{
		"gorbit99/codewindow.nvim",
		opts = {
			width_multiplier = 5,
			minimap_width = 12,
			exclude_filetypes = { "NvimTree" },
			use_lsp = true,
			use_treesitter = false,
			window_border = "none",
		},
	},
	{
		"kyazdani42/nvim-tree.lua",
		cond = true,
		opts = {
			disable_netrw = true,
			diagnostics = {
				enable = true,
			},
			view = {
				side = "right",
				-- hide_root_folder = true,
				preserve_window_proportions = true,
			},
      renderer = {
        root_folder_label = false,
      },
			filters = {
				dotfiles = true,
			},
			git = {
				ignore = false,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		},
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				hide_cursor = true,
				stop_eof = true, -- Stop at <EOF>
				respect_scrolloff = false, -- Stop when cursor reaches scrolloff margin
				cursor_scrolls_alone = true, -- Scroll even if window cannot scroll further
			})
			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<A-=>"] = { "scroll", { "-vim.wo.scroll", "true", "350" } }
			t["<A-->"] = { "scroll", { "vim.wo.scroll", "true", "350" } }
			t["+"] = { "scroll", { "-vim.wo.scroll", "true", "350" } }
			t["_"] = { "scroll", { "vim.wo.scroll", "true", "350" } }
			t["zt"] = { "zt", { "150" } }
			t["zz"] = { "zz", { "150" } }
			t["zb"] = { "zb", { "150" } }
			t["<Leader>k"] = { "zt", { "150" } }
			t["<Leader>j"] = { "zz", { "150" } }
			t["<Leader>h"] = { "zb", { "150" } }
			require("neoscroll.config").set_mappings(t)
		end,
	},

	-- Coding -----------------------------------------------
	{ "windwp/nvim-autopairs", config = true },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	"ur4ltz/move.nvim",
	"AndrewRadev/tagalong.vim",
	{ "phaazon/hop.nvim", branch = "v2", config = true },
	{
		"svermeulen/vim-extended-ft",
		init = function()
			vim.cmd("let g:ExtendedFTUseDefaults = 0")
		end,
	},
	{
		"mattn/emmet-vim",
		init = function()
			vim.cmd([[
      let g:user_emmet_leader_key=','
      let g:user_emmet_next_key='<S-CR>'
    ]])
		end,
	},
	{
		"ur4ltz/surround.nvim",
		opts = {
			mappings_style = "sandwich",
			prefix = "sd",
		},
	},
	{
		"terrortylor/nvim-comment",
		cond = true,
		config = function()
			require("nvim_comment").setup({
				comment_chunk_text_object = "<Nop>", -- remove text-object "ic"
			})
		end,
	},
	{
		"mg979/vim-visual-multi",
		init = function()
			vim.cmd([[
        let g:VM_leader = '<SPACE>'
        let g:VM_maps = {}
        let g:VM_maps['Reselect Last'] = '' "remove conflicting map
        let g:VM_maps['Add Cursor At Pos'] = '' "remove conflicting map
        let g:VM_custom_noremaps = {'`':'~'}
        let g:VM_mouse_mappings = 1
      ]])
		end,
	},

	-- Colorschemes -----------------------------------------
	"rktjmp/lush.nvim", -- colorscheme creation tool
	{ "coffee-monk/marakai" },
	{ "Everblush/everblush.nvim", name = "everblush", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "rockerBOO/boo-colorscheme-nvim", lazy = true },
	{ "metalelf0/jellybeans-nvim", lazy = true },
	{ "shaunsingh/moonlight.nvim", lazy = true },
	{ "tanvirtin/monokai.nvim", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "Mofiqul/vscode.nvim", lazy = true },
	{ "savq/melange", lazy = true },
	{ "shaunsingh/nord.nvim", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "ishan9299/nvim-solarized-lua", lazy = true },
	{ "Tsuzat/NeoSolarized.nvim", lazy = true },
	{ "Mofiqul/dracula.nvim", lazy = true },
	{ "artanikin/vim-synthwave84", lazy = true },
	{ "bluz71/vim-nightfly-guicolors", lazy = true },
	{ "JaySandhu/xcode-vim", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
}

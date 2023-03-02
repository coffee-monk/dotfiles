return {
	"Exafunction/codeium.vim",
	cond = true,
	config = function()
		vim.g.codeium_disable_bindings = 1
		--
		vim.keymap.set("i", "<A-;>", function() -- complete (init)
			return vim.fn["codeium#Complete"]()
		end, { expr = true })
		--
		vim.keymap.set("i", "<A-n>", function() -- accept
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		--
		vim.keymap.set("i", "<A-o>", function() -- next
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true })
		--
		vim.keymap.set("i", "<A-i>", function() -- previous
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true })
		--
		vim.keymap.set("i", "<C-c>", function() -- clear
			return vim.fn["codeium#Clear"]()
		end, { expr = true })
		--
		vim.cmd([[
      let g:codeium_manual = v:true
    ]])
	end,
}

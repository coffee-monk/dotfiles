return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	opts = {
		ensure_installed = { "stylua", "prettierd", "black", "shfmt" },
	},
}, {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		-- config for FORMAT on SAVE
		local on_attach = function(client)
			if client.server_capabilities.documentFormattingProvider then
				vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")
				vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format()")
			end
			if client.server_capabilities.documentRangeFormattingProvider then
				vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
			end
		end

		-- Init Config
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting

		null_ls.setup({
			debug = false,
			sources = {
				formatting.stylua,
				formatting.prettierd,
				formatting.shfmt,
				formatting.black,
			},
			-- on_attach = format_on_save,
			on_attach = on_attach,
		})
	end,
}

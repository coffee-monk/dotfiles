-- NEOVIM Initializer >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

vim.g.colorscheme = "Marakai" -- global colorscheme
--
require("config.options") -- (vim.opt) settings
--
require("config.lazy") --  plugin loader (lazy.nvim)
--
require("config.keymappings")
--
require("config.colorschemes")

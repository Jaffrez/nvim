-- start timer
vim.g.nvim_start_time = vim.uv.hrtime()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.neovide")

require("plugins")

if vim.g.neovide then
    vim.opt.guifont = "Maple Mono NF CN:h13"
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_progress_bar_enabled = false
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- for treesitter-textobjects
vim.g.no_plugin_maps = true

vim.opt.number = true
vim.opt.numberwidth = 2

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.opt.mouse = ""

-- avoid increasing startup time
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fillchars = {
    eob = " ",
}

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.showmode = false

vim.opt.pumheight = 8

vim.opt.undofile = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.opt.showcmd = false

vim.opt.ruler = false

vim.opt.cmdheight = 0

vim.opt.shadafile = "NONE"

-- use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.shortmess:append("sI")

vim.opt.title = false

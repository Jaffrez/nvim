local options = {
	number = true,
	cursorline = true,
	scrolloff = 8,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	ignorecase = true,
	smartcase = true,
	fillchars = {
		eob = " ",
	},
	splitbelow = true,
	splitright = true,
	laststatus = 3,
	showmode = false,
	winborder = "rounded",
	pumheight = 10,
	undofile = true,
	updatetime = 250,
	timeoutlen = 300,
	clipboard = "unnamedplus",
	termguicolors = true,
	signcolumn = "yes",
	confirm = true,
	wrap = false,
	sidescrolloff = 8,
	showcmd = false,
	ruler = false,
	cmdheight = 0,
	mouse = "",
	shadafile = "NONE",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

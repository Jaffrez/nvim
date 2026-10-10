local options = {
	foldmethod = "expr",
	foldexpr = "v:lua.vim.treesitter.foldexpr()",
	foldlevel = 99,
	foldlevelstart = 99,
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

if vim.o.shell:lower():match("powershell") or vim.o.shell:lower():match("pwsh") then
    vim.opt.shelltemp = false
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -Command "
        .. "[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();"
        .. "$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    vim.opt.shellpipe = "> %s 2>&1"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end

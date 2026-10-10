require("toggleterm").setup({
	shell = vim.fn.executable("nu") == 1 and "nu" or vim.o.shell,
	on_open = function(term)
		vim.wo[term.window].sidescrolloff = 0
	end,
	winbar = {
		enabled = true,
		name_formatter = function(_)
			return ""
		end,
	},
})

map("n", "<leader>lt", "<cmd>ToggleTerm<cr>", opts("Terminal: Toggle"))

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "rounded",
		height = function()
			return math.max(1, math.floor((vim.o.lines - vim.o.cmdheight - 2) * 0.9))
		end,
	},
})

function _lazygit_toggle()
	if vim.fn.executable("lazygit") ~= 1 then
		vim.notify("lazygit is not installed", vim.log.levels.WARN)
		return
	end
	lazygit:toggle()
end

map("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", opts("Terminal: Open lazygit"))

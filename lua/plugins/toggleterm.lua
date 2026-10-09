require("toggleterm").setup({
	shell = "nu.exe",
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
	lazygit:toggle()
end

map("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", opts("Terminal: Open lazygit"))

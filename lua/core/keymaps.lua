local keymaps = {
	normal = {
		["<C-h>"] = {
			"<C-w>h",
			{ desc = "Window left" },
		},
		["<C-j>"] = {
			"<C-w>j",
			{ desc = "Window down" },
		},
		["<C-k>"] = {
			"<C-w>k",
			{ desc = "Window up" },
		},
		["<C-l>"] = {
			"<C-w>l",
			{ desc = "Window right" },
		},
		["<ESC>"] = {
			"<CMD>noh<CR>",
		},
	},
	insert = {
		["jj"] = "<Esc>",
	},
	visual = {
		["<"] = {
			"<gv",
			{ desc = "Indent left" },
		},
		[">"] = {
			">gv",
			{ desc = "Indent right" },
		},
	},
	select = {},
	operator = {},
	command = {},
	terminal = {},
}

local adapter = {
	normal = "n",
	insert = "i",
	visual = "x",
	select = "s",
	operator = "o",
	command = "c",
	terminal = "t",
}

for mode, mappings in pairs(keymaps) do
	local mode = adapter[mode]

	for lhs, mapping in pairs(mappings) do
		local rhs = mapping
		local opts = {}

		if type(mapping) == "table" then
			rhs = mapping[1]
			opts = mapping[2] or {}
		end

		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

map("n", "<leader>bn", "<cmd>bnext<cr>", opts("Buffer: Next"))
map("n", "<leader>bp", "<cmd>bprevious<cr>", opts("Buffer: Previous"))
map("n", "<leader>bb", "<cmd>buffer #<cr>", opts("Buffer: Alternate"))
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts("Buffer: Delete"))
map("n", "<leader>ws", "<C-w>s", opts("Window: Split below"))
map("n", "<leader>wv", "<C-w>v", opts("Window: Split right"))
map("n", "<leader>wc", "<cmd>close<cr>", opts("Window: Close"))
map("n", "<leader>w=", "<C-w>=", opts("Window: Equal sizes"))
map("n", "<leader>cd", vim.diagnostic.open_float, opts("Code: Line diagnostics"))

for lhs, diagnostic_opts in pairs({
    ["]d"] = { count = 1, float = false },
    ["[d"] = { count = -1, float = false },
    ["]e"] = { count = 1, float = false, severity = vim.diagnostic.severity.ERROR },
    ["[e"] = { count = -1, float = false, severity = vim.diagnostic.severity.ERROR },
}) do
    map("n", lhs, function()
        vim.diagnostic.jump(diagnostic_opts)
    end, opts(diagnostic_opts.count > 0 and "Next diagnostic" or "Previous diagnostic"))
end

map("t", "<C-\\><C-\\>", "<C-\\><C-n>", opts("Terminal: Normal mode"))

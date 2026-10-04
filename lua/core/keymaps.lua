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

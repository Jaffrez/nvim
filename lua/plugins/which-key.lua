local wk = require("which-key")

wk.setup({
	plugins = {
		marks = false,
		registers = false,
		spelling = { enabled = false },
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},

	triggers = {
		{ "<auto>", mode = "nixsotc" },

		{ "g", mode = { "n", "v" } },
		{ "z", mode = { "n", "v" } },
		{ "[", mode = { "n", "v" } },
		{ "]", mode = { "n", "v" } },
		{ "<C-w>", mode = "n" },
	},
})

wk.add({
    { "<leader>b", group = "Buffer" },
    { "<leader>c", group = "Code" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "Terminal" },
    { "<leader>u", group = "UI" },
    { "<leader>w", group = "Window" },
})

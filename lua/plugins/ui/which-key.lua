local wk = require("which-key")

wk.setup({
	plugins = {
		marks = true,
		registers = true,

		spelling = {
			enabled = true,
			suggestions = 20,
		},

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

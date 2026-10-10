require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		width = 30,
	},
})

map("n", "<leader>ee", "<cmd>Neotree toggle<cr>", opts("Toggle neotree"))
map("n", "<leader>eE", "<cmd>Neotree reveal<cr>", opts("Reveal current file"))

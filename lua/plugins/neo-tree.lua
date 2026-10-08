require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		width = 30,
	},
})

map("n", "<leader>e", "<cmd>Neotree<cr>", opts("Toggle neotree"))

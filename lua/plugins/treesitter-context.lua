require("treesitter-context").setup({
	enable = true,
})

map("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, opts("Code: Context definition"))
map("n", "<leader>uc", require("treesitter-context").toggle, opts("UI: Toggle context"))

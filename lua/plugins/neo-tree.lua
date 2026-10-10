if vim.g.neovide then
	_G.NeoTreeTabline = function(width)
		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			local buf = vim.api.nvim_win_get_buf(win)
			if vim.bo[buf].filetype == "neo-tree" and vim.fn.win_gettype(win) == ""
				and vim.api.nvim_win_get_position(win)[2] == 0 then
				local tree_width = vim.api.nvim_win_get_width(win)
				width = width or tree_width
				local available = math.min(tree_width, width)
				local title = ("Explorer"):sub(1, available)
				local left = math.floor((available - #title) / 2)
				return "%#NeoTreeNormal#" .. string.rep(" ", left) .. title
					.. string.rep(" ", available - left - #title)
					.. "%#WinBar#" .. string.rep(" ", width - available)
			end
		end
		return string.rep(" ", width or 0)
	end
end

require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		width = 30,
	},
})

map("n", "<leader>ee", "<cmd>Neotree toggle<cr>", opts("Toggle neotree"))
map("n", "<leader>eE", "<cmd>Neotree reveal<cr>", opts("Reveal current file"))

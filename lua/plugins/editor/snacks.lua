require("snacks").setup({
	picker = {
		sources = {
			explorer = {
				layout = {
					auto_hide = { "input" },
					layout = {
						width = 30,
					},
				},
				win = {
					list = {
						wo = {
							winbar = "%= Explorer %=",
						},
					},
				},
			},
		},
	},
	terminal = {
		shell = "nu",
	},
	lazygit = {},
	explorer = {
		enabled = true,
	},
	dashboard = {
		enabled = true,
		width = 35,
		preset = {
			header = [[
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]],
			keys = {
				{
					icon = " ",
					key = "f",
					desc = "Find File",
					action = ":lua Snacks.dashboard.pick('files')",
				},
				{
					icon = " ",
					key = "r",
					desc = "Recent Files",
					action = ":lua Snacks.dashboard.pick('oldfiles')",
				},
				{
					icon = " ",
					key = "g",
					desc = "Find Text",
					action = ":lua Snacks.dashboard.pick('live_grep')",
				},
				{
					icon = " ",
					key = "n",
					desc = "New File",
					action = ":ene | startinsert",
				},
				{
					icon = " ",
					key = "t",
					desc = "Terminal",
					action = ":lua Snacks.terminal()",
				},
				{
					icon = " ",
					key = "l",
					desc = "LazyGit",
					action = ":lua Snacks.lazygit()",
				},
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = function()
						require("fzf-lua").files({
							cwd = vim.fn.stdpath("config"),
						})
					end,
				},
				{
					icon = " ",
					key = "q",
					desc = "Quit",
					action = ":qa",
				},
			},
		},

		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			function()
				local time = vim.g.nvim_startup_time

				return {
					text = time and string.format("󱐋 Neovim loaded in %.2f ms", time) or "󱐋 Loading...",
					align = "center",
					hl = "Comment",
					padding = 1,
				}
			end,
		},
	},
})

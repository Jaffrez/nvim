require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",

		["<A-j>"] = { "select_next", "fallback" },
		["<A-k>"] = { "select_prev", "fallback" },

		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
	},
	sources = {
		default = { "lsp", "path", "buffer" },
	},
	signature = {
		enabled = true,
	},
	completion = {
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
		menu = {
			border = "none",
			draw = {
				align_to = "label",
				padding = { 0, 1 },
				gap = 1,
				columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "kind" },
				},
				components = {
					kind_icon = {
						ellipsis = false,
						text = function(ctx)
							return ctx.kind_icon
						end,
						highlight = function(ctx)
							return ctx.kind_hl
						end,
					},

					label = {
						width = {
							fill = true,
							max = 50,
						},
					},

					label_description = {
						width = {
							max = 30,
						},
					},

					kind = {
						ellipsis = false,

						width = {
							max = 14,
						},

						text = function(ctx)
							return ctx.kind
						end,

						highlight = function(ctx)
							return ctx.kind_hl
						end,
					},
				},
			},
		},
		documentation = {
			window = {
				border = "none",
			},
		},
	},
})

local colors = require("catppuccin.palettes").get_palette("frappe")

vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = colors.green })
vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = colors.blue })
vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = colors.blue })
vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { fg = colors.sapphire })

vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = colors.teal })
vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = colors.lavender })
vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = colors.teal })

vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "BlinkCmpKindStruct", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = colors.mauve })

vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { fg = colors.peach })
vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = colors.peach })
vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { fg = colors.peach })
vim.api.nvim_set_hl(0, "BlinkCmpKindEnumMember", { fg = colors.peach })

vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = colors.red })
vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { fg = colors.peach })

vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = colors.mauve })
vim.api.nvim_set_hl(0, "BlinkCmpKindColor", { fg = colors.pink })
vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { fg = colors.blue })
vim.api.nvim_set_hl(0, "BlinkCmpKindReference", { fg = colors.red })
vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { fg = colors.blue })

vim.api.nvim_set_hl(0, "BlinkCmpKindEvent", { fg = colors.red })
vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", { fg = colors.sky })
vim.api.nvim_set_hl(0, "BlinkCmpKindTypeParameter", { fg = colors.rosewater })

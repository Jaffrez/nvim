local colors = require("catppuccin.palettes").get_palette("frappe")
local conditions = require("heirline.conditions")

local align = {
	provider = "%=",
}

local vim_mode = {
	init = function(self)
		self.mode = vim.fn.mode(1)
	end,
	static = {
		mode_names = {
			n = "NORMAL",
			no = "NORMAL",
			nov = "NORMAL",
			noV = "NORMAL",
			["no\22"] = "NORMAL",
			niI = "NORMAL",
			niR = "NORMAL",
			niV = "NORMAL",
			nt = "NORMAL",

			i = "INSERT",
			ic = "INSERT",
			ix = "INSERT",

			v = "VISUAL",
			vs = "VISUAL",
			V = "VISUAL",
			Vs = "VISUAL",
			["\22"] = "VISUAL",
			["\22s"] = "VISUAL",

			s = "SELECT",
			S = "SELECT",
			["\19"] = "SELECT",

			R = "REPLACE",
			Rc = "REPLACE",
			Rx = "REPLACE",
			Rv = "REPLACE",
			Rvc = "REPLACE",
			Rvx = "REPLACE",

			c = "COMMAND",
			cv = "COMMAND",

			t = "TERMINAL",

			r = "NORMAL",
			rm = "NORMAL",
			["r?"] = "NORMAL",
			["!"] = "COMMAND",
		},
		mode_colors = {
			NORMAL = colors.blue,
			INSERT = colors.green,
			VISUAL = colors.mauve,
			SELECT = colors.mauve,
			REPLACE = colors.red,
			COMMAND = colors.peach,
			TERMINAL = colors.green,
		},
	},
	{
		provider = function(self)
			return "  %-8(" .. self.mode_names[self.mode] .. "%)"
		end,
		hl = function(self)
			local mode = self.mode_names[self.mode]
			return {
				fg = colors.base,
				bg = self.mode_colors[mode],
				bold = true,
			}
		end,
	},
	{
		provider = "",
		hl = function(self)
			local mode = self.mode_names[self.mode]
			return {
				fg = self.mode_colors[mode],
			}
		end,
	},
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}

local ruler = {
	provider = " %-10(%P %L:%c%)",
	hl = {
		fg = colors.overlay1,
	},
}

local file_name_and_icon = {
	init = function(self)
		self.icon = MiniIcons.get("file", vim.api.nvim_buf_get_name(0))
		self.name = vim.fn.expand("%:t")

		if self.name == "" then
			self.name = "[No Name]"
		end
	end,
	{
		provider = "",
		hl = {
			fg = colors.red,
		},
	},
	{
		provider = function(self)
			return self.icon .. " " .. self.name .. " "
		end,
		hl = {
			fg = colors.base,
			bg = colors.red,
		},
	},
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "[+]",
		hl = { fg = colors.base, bg = colors.red },
	},
}

local directory = {
	{
		provider = "",
		hl = {
			fg = colors.pink,
			bg = colors.red,
		},
	},
	{
		provider = function(self)
			return "  " .. vim.fn.expand("%:p:h:t") .. " "
		end,
		hl = {
			fg = colors.base,
			bg = colors.flamingo,
		},
	},
}

local lsp_status = {
	init = function(self)
		self.clients = vim.lsp.get_clients({ bufnr = 0 })

		self.healthy = #self.clients > 0

		for _, client in ipairs(self.clients) do
			if not client.initialized or client:is_stopped() then
				self.healthy = false
				break
			end
		end
	end,

	update = {
		"LspAttach",
		"LspDetach",
		"BufEnter",
	},

	{
		provider = " ",
		hl = function(self)
			return {
				fg = self.healthy and colors.green or colors.yellow,
			}
		end,
	},

	{
		provider = function(self)
			if #self.clients == 0 then
				return "No LSP"
			end

			local names = {}

			for _, client in ipairs(self.clients) do
				table.insert(names, client.name)
			end

			return table.concat(names, ", ") .. " "
		end,

		hl = {
			fg = colors.text,
		},
	},
}

local diagnostic = {
	condition = function()
		return #vim.diagnostic.get(0) > 0
	end,

	init = function(self)
		self.errors = #vim.diagnostic.get(0, {
			severity = vim.diagnostic.severity.ERROR,
		})

		self.warnings = #vim.diagnostic.get(0, {
			severity = vim.diagnostic.severity.WARN,
		})

		self.hints = #vim.diagnostic.get(0, {
			severity = vim.diagnostic.severity.HINT,
		})
	end,

	update = {
		"DiagnosticChanged",
		"BufEnter",
	},

	{
		condition = function(self)
			return self.errors > 0
		end,
		provider = function(self)
			return " " .. self.errors .. " "
		end,
		hl = "DiagnosticError",
	},

	{
		condition = function(self)
			return self.warnings > 0
		end,
		provider = function(self)
			return " " .. self.warnings .. " "
		end,
		hl = "DiagnosticWarn",
	},

	{
		condition = function(self)
			return self.hints > 0
		end,
		provider = function(self)
			return "󰌵 " .. self.hints .. " "
		end,
		hl = "DiagnosticHint",
	},
}

local git = {
	condition = function()
		return vim.b.gitsigns_head ~= nil and vim.b.gitsigns_head ~= ""
	end,
	provider = function()
		return "  " .. vim.b.gitsigns_head .. " "
	end,
	hl = {
		fg = colors.overlay1,
		bold = true,
	},
}

local status_line = {
	hl = {
		bg = colors.surface0,
	},
	vim_mode,
	ruler,
	git,
	align,
	diagnostic,
	align,
	lsp_status,
	file_name_and_icon,
	directory,
}

require("heirline").setup({ statusline = status_line })

local colors = require("catppuccin.palettes").get_palette("frappe")
local icons = require("mini.icons")

local function escape(text)
	return (text:gsub("%%", "%%%%"))
end

local function redraw_status()
	vim.schedule(function()
		vim.cmd("redrawstatus")
	end)
end

local mode_names = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "VISUAL",
	["\22"] = "VISUAL",
	s = "SELECT",
	S = "SELECT",
	["\19"] = "SELECT",
	R = "REPLACE",
	c = "COMMAND",
	t = "TERMINAL",
	r = "NORMAL",
	["!"] = "COMMAND",
}

local mode_colors = {
	NORMAL = colors.blue,
	INSERT = colors.green,
	VISUAL = colors.mauve,
	SELECT = colors.mauve,
	REPLACE = colors.red,
	COMMAND = colors.peach,
	TERMINAL = colors.green,
}

local mode = {
	init = function(self)
		self.label = mode_names[vim.fn.mode(1):sub(1, 1)] or "UNKNOWN"
		self.color = mode_colors[self.label] or colors.overlay1
	end,
	{
		provider = function(self)
			return "  %-8(" .. self.label .. "%)"
		end,
		hl = function(self)
			return { fg = colors.base, bg = self.color, bold = true }
		end,
	},
	{
		provider = "",
		hl = function(self)
			return { fg = self.color }
		end,
	},
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = redraw_status,
	},
}

local position = {
	provider = " %-10(%P %L:%c%)",
	hl = { fg = colors.overlay1 },
}

local file = {
	init = function(self)
		self.icon = icons.get("file", vim.api.nvim_buf_get_name(0))
		self.name = vim.fn.expand("%:t")
		if self.name == "" then
			self.name = "[No Name]"
		end
	end,
	{
		provider = "",
		hl = { fg = colors.red },
	},
	{
		provider = function(self)
			return escape(self.icon .. " " .. self.name .. " ")
		end,
		hl = { fg = colors.base, bg = colors.red },
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
		hl = { fg = colors.flamingo, bg = colors.red },
	},
	{
		provider = function()
			return "  " .. escape(vim.fn.expand("%:p:h:t")) .. " "
		end,
		hl = { fg = colors.base, bg = colors.flamingo },
	},
}

local lsp = {
	condition = function(self)
		self.clients = vim.lsp.get_clients({ bufnr = 0 })
		return #self.clients > 0
	end,
	init = function(self)
		local clients = self.clients
		local names, seen = {}, {}
		self.healthy = #clients > 0

		for _, client in ipairs(clients) do
			if not seen[client.name] then
				names[#names + 1] = client.name
				seen[client.name] = true
			end
			if not client.initialized or client:is_stopped() then
				self.healthy = false
			end
		end

		table.sort(names)
		self.names = table.concat(names, ", ")
	end,
	{
		provider = " ",
		hl = function(self)
			return { fg = self.healthy and colors.green or colors.yellow }
		end,
	},
	{
		provider = function(self)
			return escape(self.names) .. " "
		end,
		hl = { fg = colors.text },
	},
	update = {
		"LspAttach",
		"LspDetach",
		"BufEnter",
		callback = redraw_status,
	},
}

local severity = vim.diagnostic.severity

local function diagnostic_item(level, icon, highlight)
	return {
		condition = function(self)
			return self.counts[level] > 0
		end,
		provider = function(self)
			return icon .. " " .. self.counts[level] .. " "
		end,
		hl = highlight,
	}
end

local diagnostics = {
	init = function(self)
		self.counts = {
			[severity.ERROR] = 0,
			[severity.WARN] = 0,
			[severity.INFO] = 0,
			[severity.HINT] = 0,
		}
		for _, diagnostic in ipairs(vim.diagnostic.get(0)) do
			local level = diagnostic.severity
			if self.counts[level] then
				self.counts[level] = self.counts[level] + 1
			end
		end
	end,
	diagnostic_item(severity.ERROR, "", "DiagnosticError"),
	diagnostic_item(severity.WARN, "", "DiagnosticWarn"),
	diagnostic_item(severity.INFO, "", "DiagnosticInfo"),
	diagnostic_item(severity.HINT, "󰌵", "DiagnosticHint"),
	update = {
		"DiagnosticChanged",
		"BufEnter",
		callback = redraw_status,
	},
}

local align = { provider = "%=" }

require("heirline").setup({
	statusline = {
		hl = { bg = colors.surface0 },
		mode,
		position,
		align,
		diagnostics,
		align,
		lsp,
		file,
		directory,
	},
})

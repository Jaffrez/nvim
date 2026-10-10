local sources = require("dropbar.sources")
local utils = require("dropbar.utils")
local dropbar = require("dropbar")

local config = {
	bar = {
		sources = function(_, _)
			return {
				sources.path,
				utils.source.fallback({
					sources.lsp,
					sources.treesitter,
				}),
			}
		end,
	},

	sources = {
		path = {
			max_depth = 1,
		},
	},
}

if vim.g.neovide then
	local configs = require("dropbar.configs")
	local enabled = configs.opts.bar.enable
	local bar_type = require("dropbar.bar").dropbar_t
	local menu_type = require("dropbar.menu").dropbar_menu_t
	local redraw = bar_type.redraw
	local eval_win_configs = menu_type.eval_win_configs
	local active_bar

	config.bar.enable = false
	config.bar.hover = false

	bar_type.redraw = function(self)
		redraw(self)
		vim.cmd.redrawtabline()
	end

	menu_type.eval_win_configs = function(self)
		eval_win_configs(self)
		if not self.prev_menu then
			local offset = vim.api.nvim_win_get_position(self.prev_win)[2]
			if type(self.win_configs.col) == "number" then
				self._win_configs.col = self._win_configs.col + offset
			end
			self._win_configs.relative = "editor"
			self._win_configs.win = nil
			self._win_configs.row = 1
		end
	end

	_G.DropbarTabline = function()
		if not active_bar or not vim.api.nvim_win_is_valid(active_bar.win) then
			return _G.NeoTreeTabline and _G.NeoTreeTabline() or ""
		end
		local offset = vim.api.nvim_win_get_position(active_bar.win)[2]
		local prefix = _G.NeoTreeTabline and _G.NeoTreeTabline(offset) or string.rep(" ", offset)
		return prefix .. "%#WinBar#" .. active_bar()
	end

	local function set_highlights()
		vim.api.nvim_set_hl(0, "TabLine", { link = "WinBar" })
		vim.api.nvim_set_hl(0, "TabLineFill", { link = "WinBar" })
	end

	local function refresh()
		local win = vim.api.nvim_get_current_win()
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype:match("^dropbar_menu") then
			return
		end
		if vim.bo[buf].filetype == "neo-tree" then
			if active_bar and vim.api.nvim_win_is_valid(active_bar.win)
				and vim.api.nvim_win_get_buf(active_bar.win) == active_bar.buf then
				vim.cmd.redrawtabline()
				return
			end
			for _, candidate in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				local candidate_buf = vim.api.nvim_win_get_buf(candidate)
				if enabled(candidate_buf, candidate) and vim.bo[candidate_buf].buftype == "" then
					win, buf = candidate, candidate_buf
					break
				end
			end
		end
		active_bar = nil
		if enabled(buf, win) and vim.bo[buf].buftype == "" then
			active_bar = _G.dropbar.bars[buf][win]
			active_bar:update()
		end
		vim.cmd.redrawtabline()
	end

	local group = vim.api.nvim_create_augroup("DropbarTabline", { clear = true })
	vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "FileType", "LspAttach", "WinResized", "WinClosed" }, {
		group = group,
		callback = function()
			vim.schedule(refresh)
		end,
	})
	vim.api.nvim_create_autocmd("ColorScheme", {
		group = group,
		callback = set_highlights,
	})
	set_highlights()

	vim.o.showtabline = 2
	vim.o.tabline = "%{%v:lua.DropbarTabline()%}"
	vim.schedule(refresh)
end

dropbar.setup(config)

map("n", "<leader>cb", require("dropbar.api").pick, opts("Code: Pick breadcrumb"))

local map = vim.keymap.set

local function opts(desc)
	return {
		silent = true,
		desc = desc,
	}
end

-- ============================================================================
-- Conform
-- ============================================================================

map({ "n", "v" }, "<leader>cf", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, opts("Code: Format"))

-- ============================================================================
-- FzfLua
-- ============================================================================

local fzf = require("fzf-lua")

map("n", "<leader>ff", fzf.files, opts("Find: Files"))
map("n", "<leader>fg", fzf.live_grep, opts("Find: Grep"))
map("n", "<leader>fb", fzf.buffers, opts("Find: Buffers"))
map("n", "<leader>fr", fzf.oldfiles, opts("Find: Recent Files"))

map("n", "<leader>fs", fzf.lsp_document_symbols, opts("Find: Document Symbols"))
map("n", "<leader>fS", fzf.lsp_workspace_symbols, opts("Find: Workspace Symbols"))

-- ============================================================================
-- Gitsigns
-- ============================================================================

local gitsigns = require("gitsigns")

-- Hunk navigation
map("n", "]h", function()
	gitsigns.nav_hunk("next")
end, opts("Git: Next Hunk"))

map("n", "[h", function()
	gitsigns.nav_hunk("prev")
end, opts("Git: Previous Hunk"))

-- Hunk actions
map("n", "<leader>gs", gitsigns.stage_hunk, opts("Git: Stage Hunk"))
map("n", "<leader>gr", gitsigns.reset_hunk, opts("Git: Reset Hunk"))
map("n", "<leader>gp", gitsigns.preview_hunk, opts("Git: Preview Hunk"))
map("n", "<leader>gb", gitsigns.blame_line, opts("Git: Blame Line"))

-- Visual selection
map("v", "<leader>gs", function()
	gitsigns.stage_hunk({
		vim.fn.line("."),
		vim.fn.line("v"),
	})
end, opts("Git: Stage Hunk"))

map("v", "<leader>gr", function()
	gitsigns.reset_hunk({
		vim.fn.line("."),
		vim.fn.line("v"),
	})
end, opts("Git: Reset Hunk"))

-- ============================================================================
-- Snacks
-- ============================================================================

-- Terminal
map({ "n", "t" }, "<A-`>", function()
	Snacks.terminal()
end, opts("Terminal: Toggle"))

-- LazyGit
map("n", "<leader>gg", function()
	Snacks.lazygit()
end, opts("Git: LazyGit"))

-- Explorer
map("n", "<leader>e", function()
	Snacks.explorer()
end, {
	desc = "Explorer",
})

-- Projects
map("n", "<leader>fp", function()
	Snacks.picker.projects()
end, opts("Find: Projects"))

-- ============================================================================
-- Rustaceanvim
-- ============================================================================

map("n", "<leader>rr", function()
	vim.cmd.RustLsp("runnables")
end, opts("Rust: Runnables"))

map("n", "<leader>rt", function()
	vim.cmd.RustLsp("testables")
end, opts("Rust: Testables"))

map("n", "<leader>re", function()
	vim.cmd.RustLsp("explainError")
end, opts("Rust: Explain Error"))

map("n", "<leader>rm", function()
	vim.cmd.RustLsp("expandMacro")
end, opts("Rust: Expand Macro"))

-- ============================================================================
-- Fidget
-- ============================================================================

map("n", "<leader>nh", "<cmd>Fidget history<cr>", opts("Notification: History"))
map("n", "<leader>nc", "<cmd>Fidget clear<cr>", opts("Notification: Clear"))
map("n", "<leader>nC", "<cmd>Fidget clear_history<cr>", opts("Notification: Clear History"))

-- ============================================================================
-- LSP
-- ============================================================================

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = event.buf,
				silent = true,
				desc = desc,
			})
		end

		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, "LSP: Definition")
		map("n", "gD", vim.lsp.buf.declaration, "LSP: Declaration")
		map("n", "K", vim.lsp.buf.hover, "LSP: Hover")

		-- Code
		map("n", "<leader>ca", vim.lsp.buf.code_action, "Code: Action")
		map("n", "<leader>cr", vim.lsp.buf.rename, "Code: Rename")

		-- Diagnostics
		map("n", "<leader>cd", vim.diagnostic.open_float, "Code: Diagnostics")

		-- Signature help
		map("i", "<C-k>", vim.lsp.buf.signature_help, "LSP: Signature Help")
	end,
})

-- ============================================================================
-- LSP / Diagnostic Toggles
-- ============================================================================

map("n", "<leader>ud", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, opts("Toggle: Diagnostics"))

map("n", "<leader>ui", function()
	local enabled = vim.lsp.inlay_hint.is_enabled({
		bufnr = 0,
	})

	vim.lsp.inlay_hint.enable(not enabled, {
		bufnr = 0,
	})
end, opts("Toggle: Inlay Hints"))

local conform = require("conform")

conform.setup({
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

map({ "n", "x" }, "<leader>cf", function()
    conform.format({ timeout_ms = 1500 })
end, opts("Code: Format"))

local sources = require("dropbar.sources")
local utils = require("dropbar.utils")

require("dropbar").setup({
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
})

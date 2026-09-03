local fzf = require("fzf-lua")

fzf.setup({
	file_icons = "mini",
	fzf_colors = true,
	files = {
		formatter = "path.filename_first",
	},
})

fzf.register_ui_select()

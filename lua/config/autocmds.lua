local function set_ime(args)
	if args.event:match("Enter$") then
		vim.g.neovide_input_ime = true
	else
		vim.g.neovide_input_ime = false
	end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
	group = ime_input,
	pattern = "*",
	callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
	group = ime_input,
	pattern = "[/\\?]",
	callback = set_ime,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.g.nvim_startup_time = (vim.uv.hrtime() - vim.g.nvim_start_time) / 1e6

		vim.schedule(function()
			if Snacks and Snacks.dashboard then
				Snacks.dashboard.update()
			end
		end)
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "GitSignsUpdate",
	callback = function()
		vim.cmd("redrawstatus")
	end,
})

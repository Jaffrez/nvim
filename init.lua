if vim.fn.has "nvim-0.12" ~= 1 then
  vim.notify("Please upgrade your neovim(require v0.12+)", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd "cquit"
end

vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local disabled_builtin_plugins = {
    "gzip",
    "matchit",
    "matchparen",
    "netrw",
    "netrwPlugin",
    "nvim_net_plugin",
    "remote_plugins",
    "shada_plugin",
    "spellfile_plugin",
    "tarPlugin",
    "tutor_mode_plugin",
    "zipPlugin",
    "man",
}

for _, plugin in ipairs(disabled_builtin_plugins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.g.editorconfig = false
vim.g.termfeatures = vim.tbl_extend("force", vim.g.termfeatures or {}, { osc52 = false })

-- Disable unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

_G.map = vim.keymap.set
function _G.opts(desc)
	return {
		silent = true,
		desc = desc,
	}
end


require("core.neovide")
require("core.keymaps")
require("core.options")

require("plugins")

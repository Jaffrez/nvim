if vim.fn.has "nvim-0.12" ~= 1 then
  vim.notify("Please upgrade your neovim(require v0.12+)", vim.log.levels.WARN)
  vim.wait(5000, function()
    return false
  end)
  vim.cmd "cquit"
end

vim.loader.enable()

require("util.disable")
require("core.options")
require("core.keymaps")
require("core.autocmds")

require("plugins")

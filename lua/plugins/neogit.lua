local backdrop = require("util.backdrop")
local neogit = require("neogit")

neogit.setup({
    kind = "floating",
    floating = {
        relative = "editor",
        width = 0.85,
        height = 0.8,
        style = "minimal",
        border = "none",
    },
})

local function open_neogit()
    backdrop.open({
        blend = 60,
        zindex = 40,
    })

    local group = vim.api.nvim_create_augroup("NeogitBackdrop", {
        clear = true,
    })

    local function attach()
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_win_get_buf(win)

        if vim.bo[buf].filetype ~= "NeogitStatus" then
            return
        end

        if vim.api.nvim_win_get_config(win).relative == "" then
            return
        end

        vim.api.nvim_clear_autocmds({ group = group })

        vim.api.nvim_create_autocmd("WinClosed", {
            group = group,
            pattern = tostring(win),
            once = true,
            callback = function()
                vim.schedule(backdrop.close)
            end,
        })
    end

    vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
        group = group,
        callback = function()
            vim.schedule(attach)
        end,
    })

    local ok, err = pcall(require("neogit").open, {
        kind = "floating",
    })

    if not ok then
        backdrop.close()
        vim.api.nvim_clear_autocmds({ group = group })
        error(err)
    end

    vim.schedule(attach)
end

vim.keymap.set("n", "<leader>lg", open_neogit, {
    desc = "Git: Open Neogit",
})

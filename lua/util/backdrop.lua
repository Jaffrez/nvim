local M = {}

local api = vim.api

local window
local buffer

local group = api.nvim_create_augroup("CustomBackdrop", {
    clear = true,
})

local function dimensions()
    return vim.o.columns, math.max(1, vim.o.lines - vim.o.cmdheight - 1)
end

function M.close()
    if window and api.nvim_win_is_valid(window) then
        api.nvim_win_close(window, true)
    end

    if buffer and api.nvim_buf_is_valid(buffer) then
        api.nvim_buf_delete(buffer, { force = true })
    end

    window = nil
    buffer = nil

    api.nvim_clear_autocmds({ group = group })
end

function M.open(opts)
    opts = opts or {}

    M.close()

    local width, height = dimensions()

    api.nvim_set_hl(0, "CustomBackdrop", {
        bg = opts.bg or "#000000",
    })

    buffer = api.nvim_create_buf(false, true)

    window = api.nvim_open_win(buffer, false, {
        relative = "editor",
        row = 0,
        col = 0,
        width = width,
        height = height,
        style = "minimal",
        border = "none",
        focusable = false,
        zindex = opts.zindex or 40,
        noautocmd = true,
    })

    vim.wo[window].winblend = opts.blend or 60
    vim.wo[window].winhighlight = "Normal:CustomBackdrop,NormalFloat:CustomBackdrop"
    vim.wo[window].fillchars = "eob: "

    api.nvim_create_autocmd("VimResized", {
        group = group,
        callback = function()
            if window and api.nvim_win_is_valid(window) then
                local w, h = dimensions()
                api.nvim_win_set_config(window, {
                    width = w,
                    height = h,
                })
            end
        end,
    })

    return window
end

return M

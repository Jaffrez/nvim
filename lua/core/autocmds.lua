if vim.g.neovide then
    -- Disable IME by default
    vim.g.neovide_input_ime = false

    local function set_ime(args)
        vim.g.neovide_input_ime = args.event:match("Enter$") ~= nil
    end

    local group = vim.api.nvim_create_augroup("ime_input", {
        clear = true,
    })

    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        group = group,
        callback = set_ime,
    })

    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
        group = group,
        pattern = "[/\\?]",
        callback = set_ime,
    })
end

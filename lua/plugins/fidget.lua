require("fidget").setup({
    progress = {
        suppress_on_insert = false,
        ignore_done_already = false,
        ignore_empty_message = true,

        display = {
            render_limit = 8,
            done_ttl = 2,
            progress_ttl = math.huge,

            done_icon = "✔",
            progress_icon = { "dots" },

            skip_history = true,
        },
    },

    notification = {
        override_vim_notify = true,
        filter = vim.log.levels.INFO,
        history_size = 128,

        view = {
            stack_upwards = true,
            reflow = false,
        },

        window = {
            border = "none",
            winblend = 0,
            max_width = 0,
            max_height = 0,
            x_padding = 1,
            y_padding = 0,
            align = "bottom",
            h_align = "right",
        },
    },

    logger = {
        level = vim.log.levels.WARN,
    },
})

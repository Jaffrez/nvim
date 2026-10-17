require("blink.cmp").setup({
    keymap = {
        preset = "enter",
    },
    completion = {
        menu = {
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label", gap = 1 },
                    { "kind" },
                },
                components = {
                    kind_icon = {
                        highlight = function(ctx)
                            return "BlinkCmpKind" .. ctx.kind
                        end,
                    },
                    kind = {
                        highlight = function(ctx)
                            return "BlinkCmpKind" .. ctx.kind
                        end,
                    },
                },
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
        },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning",
    },
})

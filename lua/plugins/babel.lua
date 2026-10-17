require("babel").setup({
    source = "en",
    target = "zh",
    provider = "google",
    float = {
        mode = "cursor",
        enter = false,
        auto_close = true,
    },
})

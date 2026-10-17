require("arborist").setup({
    update_cadence = "weekly",
    prefer_wasm = false,
    compiler = "clang",
    install_popular = false,
    ensure_installed = {
        "c",
        "cpp",
        "html",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "toml",
        "yaml",
        "latex",
    },
})

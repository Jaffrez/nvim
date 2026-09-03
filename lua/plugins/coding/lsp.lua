vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },

            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
})

vim.lsp.enable({
    "lua_ls"
})

vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
        prefix = "●",
        source = "if_many",
    },

    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
})

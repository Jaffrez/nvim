require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})

vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.keymap.set({ "n", "x" }, "<leader>cf", function()
    require("conform").format({
        async = true,
        lsp_format = "never",
    })
end, { desc = "Format code" })

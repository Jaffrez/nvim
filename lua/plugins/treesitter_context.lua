require("treesitter-context").setup({
    on_attach = function(bufnr)
        return vim.bo[bufnr].filetype ~= "markdown"
    end,
})

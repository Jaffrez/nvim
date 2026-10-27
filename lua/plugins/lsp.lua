vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({ "lua_ls", "clangd", "ruff", "just", "tombi" })

vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local fzf = require("fzf-lua")

        -- Navigation
        vim.keymap.set("n", "gd", fzf.lsp_definitions, {
            buffer = event.buf,
            desc = "Go to definition",
        })

        -- Code
        vim.keymap.set({ "n", "x" }, "<leader>ca", fzf.lsp_code_actions, {
            buffer = event.buf,
            desc = "Code action",
        })

        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {
            buffer = event.buf,
            desc = "Rename symbol",
        })

        vim.keymap.set("n", "<leader>cd", function()
            vim.diagnostic.open_float({ scope = "line" })
        end, {
            buffer = event.buf,
            desc = "Line diagnostics",
        })

        vim.keymap.set("n", "<leader>cs", fzf.lsp_document_symbols, {
            buffer = event.buf,
            desc = "Document symbols",
        })

        vim.keymap.set("n", "<leader>cS", fzf.lsp_workspace_symbols, {
            buffer = event.buf,
            desc = "Workspace symbols",
        })
    end,
})

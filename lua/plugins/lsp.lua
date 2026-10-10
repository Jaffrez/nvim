vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        local function bind(method, lhs, rhs, desc, mode)
            if client:supports_method(method, args.buf) then
                vim.keymap.set(mode or "n", lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
            end
        end

        local fzf = require("fzf-lua")
        bind("textDocument/definition", "gd", fzf.lsp_definitions, "Code: Definition")
        bind("textDocument/declaration", "gD", vim.lsp.buf.declaration, "Code: Declaration")
        bind("textDocument/references", "gr", fzf.lsp_references, "Code: References")
        bind("textDocument/implementation", "gi", fzf.lsp_implementations, "Code: Implementation")
        bind("textDocument/typeDefinition", "gy", fzf.lsp_typedefs, "Code: Type definition")
        bind("textDocument/hover", "K", vim.lsp.buf.hover, "Code: Documentation")
        bind("textDocument/rename", "<leader>cr", vim.lsp.buf.rename, "Code: Rename")
        bind("textDocument/codeAction", "<leader>ca", vim.lsp.buf.code_action, "Code: Action", { "n", "x" })
        bind("textDocument/signatureHelp", "<leader>ck", vim.lsp.buf.signature_help, "Code: Signature")
        bind("textDocument/prepareCallHierarchy", "<leader>ci", fzf.lsp_incoming_calls, "Code: Incoming calls")
        bind("textDocument/prepareCallHierarchy", "<leader>co", fzf.lsp_outgoing_calls, "Code: Outgoing calls")

        if client.name == "rust-analyzer" then
            vim.keymap.set("n", "<leader>ca", "<cmd>RustLsp codeAction<cr>", {
                buffer = args.buf, silent = true, desc = "Code: Rust action",
            })
            vim.keymap.set("n", "<leader>cR", "<cmd>RustLsp runnables<cr>", {
                buffer = args.buf, silent = true, desc = "Code: Rust runnables",
            })
            vim.keymap.set("n", "<leader>cm", "<cmd>RustLsp expandMacro<cr>", {
                buffer = args.buf, silent = true, desc = "Code: Expand Rust macro",
            })
        end
    end,
})

vim.lsp.enable({ "lua_ls" })

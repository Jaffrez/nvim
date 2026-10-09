local fzf = require("fzf-lua")
fzf.setup({
    file_icons = "mini",
    fzf_colors = true,
    files = {
        formatter = "path.filename_first",
    },
})
fzf.register_ui_select()

map("n", "<leader>ff", fzf.files, opts("Find: Files"))
map("n", "<leader>fg", fzf.live_grep, opts("Find: Grep"))
map("n", "<leader>fb", fzf.buffers, opts("Find: Buffers"))

map("n", "<leader>fs", fzf.lsp_document_symbols, opts("Find: Document Symbols"))
map("n", "<leader>fS", fzf.lsp_workspace_symbols, opts("Find: Workspace Symbols"))

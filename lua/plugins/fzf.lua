local fzf = require("fzf-lua")
fzf.setup({
    file_icons = "mini",
    fzf_colors = true,
    winopts = {
        on_create = function(args)
            vim.wo[args.winid].sidescrolloff = 0
        end,
    },
    files = {
        formatter = "path.filename_first",
    },
})
fzf.register_ui_select()

map("n", "<leader>ff", fzf.files, opts("Find: Files"))
map("n", "<leader>fg", fzf.live_grep, opts("Find: Grep"))
map("n", "<leader>fb", fzf.buffers, opts("Find: Buffers"))
map("n", "<leader>fw", fzf.grep_cword, opts("Find: Word under cursor"))
map("x", "<leader>fw", fzf.grep_visual, opts("Find: Selection"))
map("n", "<leader>f/", fzf.blines, opts("Find: Buffer lines"))
map("n", "<leader>fd", fzf.diagnostics_document, opts("Find: Buffer diagnostics"))
map("n", "<leader>fD", fzf.diagnostics_workspace, opts("Find: Workspace diagnostics"))
map("n", "<leader>fq", fzf.quickfix, opts("Find: Quickfix"))
map("n", "<leader>fh", fzf.helptags, opts("Find: Help"))
map("n", "<leader>fk", fzf.keymaps, opts("Find: Keymaps"))
map("n", "<leader>gc", fzf.git_commits, opts("Git: Commits"))
map("n", "<leader>gs", fzf.git_status, opts("Git: Status"))

map("n", "<leader>fs", fzf.lsp_document_symbols, opts("Find: Document Symbols"))
map("n", "<leader>fS", fzf.lsp_workspace_symbols, opts("Find: Workspace Symbols"))

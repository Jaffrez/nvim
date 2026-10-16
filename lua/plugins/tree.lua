require("nvim-tree").setup({
    view = {
        width = 32,
        signcolumn = "no",
        preserve_window_proportions = true,
    },
    renderer = {
        root_folder_label = false,
        group_empty = true,
        indent_width = 2,

        highlight_git = "name",
        highlight_opened_files = "name",

        icons = {
            git_placement = "right_align",

            glyphs = {
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                },
                git = {
                    unstaged = "M",
                    staged = "S",
                    unmerged = "U",
                    renamed = "R",
                    untracked = "?",
                    deleted = "D",
                    ignored = "I",
                },
            },
        },
    },
    git = {
        enable = true,
        show_on_dirs = false,
    },
    filters = {
        dotfiles = true,
    },
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer: Toggle" })

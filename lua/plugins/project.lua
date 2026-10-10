require("project").setup({
    fzf_lua = {
        enabled = true,
    },
})

map("n", "<leader>fp", "<cmd>Project fzf-lua<cr>", opts("Find: Projects"))

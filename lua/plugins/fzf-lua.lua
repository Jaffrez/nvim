local fzf = require("fzf-lua")

fzf.setup({
    files = {
        cwd_prompt = false,
        prompt = "Find Files> ",
    },
    buffers = {
        prompt = "Find Buffers> ",
    },
    live_grep = {
        prompt = "Live Grep> ",
    },
    fzf_colors = true,
    winopts = {
        height = 0.75,
        width = 0.4,
        border = "none",
        preview = {
            hidden = true,
        }
    }
})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find: Files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Find: Grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find: Buffers" })
vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "Find: Word under cursor" })
vim.keymap.set("x", "<leader>fw", fzf.grep_visual, { desc = "Find: Selection" })
vim.keymap.set("n", "<leader>fh", fzf.helptags, { desc = "Find: Help" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Find: Keymaps" })

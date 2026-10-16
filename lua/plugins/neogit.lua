local neogit = require("neogit")

neogit.setup({
    kind = "floating",
    floating = {
        relative = "editor",
        width = 0.85,
        height = 0.8,
        style = "minimal",
        border = "none",
    },
})

vim.keymap.set("n", "<leader>lg", neogit.open, { desc = "Open Neogit UI" })

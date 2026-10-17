local expand = require("project.util").strip_slash

require("project").setup({
    fzf_lua = {
        enabled = true,
    },
    custom_projects = {
        { path = expand("~/projects") },
    },
})

vim.keymap.set("n", "<leader>fp", "<cmd>Project fzf-lua<cr>", { desc = "Find: Projects" })

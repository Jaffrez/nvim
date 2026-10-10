require("gitblame").setup({})

map("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", opts("Git: Toggle blame"))
map("n", "<leader>gy", "<cmd>GitBlameCopySHA<cr>", opts("Git: Copy commit SHA"))

require("toggleterm").setup({
    shell = vim.fn.executable("nu") == 1 and "nu" or vim.o.shell,
})

vim.keymap.set({ "n", "t" }, "<A-`>", "<cmd>ToggleTerm<cr>", { desc = "Terminal: Toggle" })

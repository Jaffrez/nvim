require("catppuccin").setup({
    term_colors = true,
    integrations = {
        fzf = true,
        fidget = true,
        blink_indent = true,
        treesitter_context = true,
        nvimtree = true,
        neogit = true,
    }
})

vim.cmd.colorscheme("catppuccin-frappe")

if vim.g.neovide then
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if normal.bg then
        vim.g.neovide_title_background_color = string.format("#%06x", normal.bg)
    end
end

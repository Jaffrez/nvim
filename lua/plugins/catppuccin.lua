local kind_colors = {
    Text = "green",
    Method = "blue",
    Function = "blue",
    Constructor = "sapphire",
    Field = "teal",
    Variable = "mauve",
    Class = "yellow",
    Interface = "yellow",
    Module = "blue",
    Property = "teal",
    Unit = "peach",
    Value = "peach",
    Enum = "yellow",
    Keyword = "red",
    Snippet = "maroon",
    Color = "pink",
    File = "blue",
    Reference = "lavender",
    Folder = "blue",
    EnumMember = "peach",
    Constant = "peach",
    Struct = "yellow",
    Event = "peach",
    Operator = "sky",
    TypeParameter = "yellow",
}

require("catppuccin").setup({
    flavour = "frappe",
    term_colors = true,
    custom_highlights = function(colors)
        local highlights = {}

        for kind, color in pairs(kind_colors) do
            highlights["BlinkCmpKind" .. kind] = {
                fg = colors[color],
            }
        end

        return highlights
    end,
})

vim.cmd.colorscheme("catppuccin")

if vim.g.neovide then
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if normal.bg then
        vim.g.neovide_title_background_color = string.format("#%06x", normal.bg)
    end
end

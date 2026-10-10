vim.g.no_plugin_maps = true
require("nvim-treesitter-textobjects").setup({
    select = { lookahead = true },
    move = { set_jumps = true },
})

for lhs, capture in pairs({
    af = "@function.outer", ["if"] = "@function.inner",
    ac = "@class.outer", ic = "@class.inner",
    aa = "@parameter.outer", ia = "@parameter.inner",
}) do
    map({ "x", "o" }, lhs, function()
        require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects")
    end, opts("Select " .. capture))
end

for lhs, method in pairs({
    ["]f"] = "goto_next_start", ["[f"] = "goto_previous_start",
    ["]F"] = "goto_next_end", ["[F"] = "goto_previous_end",
}) do
    map({ "n", "x", "o" }, lhs, function()
        require("nvim-treesitter-textobjects.move")[method]("@function.outer", "textobjects")
    end, opts("Function: " .. method:gsub("_", " ")))
end

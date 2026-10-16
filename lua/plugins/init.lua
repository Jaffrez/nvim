vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/nvim-mini/mini.icons", name = "mini-icons" },
    { src = "https://github.com/rebelot/heirline.nvim", name = "heirline" },
    { src = "https://github.com/j-hui/fidget.nvim", name = "fidget" },
    { src = "https://github.com/folke/which-key.nvim", name = "which-key" },
    { src = "https://github.com/arborist-ts/arborist.nvim", name = "arborist" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context", name = "treesitter-context" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", name = "treesitter-textobjects" },
    { src = "https://github.com/OXY2DEV/foldtext.nvim", name = "foldtext" },
    { src = "https://github.com/saghen/blink.lib", name = "blink-lib" },
    { src = "https://github.com/saghen/blink.pairs", name = "blink-pairs" },
    { src = "https://github.com/saghen/blink.indent", name = "blink-indent" },
    { src = "https://github.com/ibhagwan/fzf-lua", name = "fzf-lua" },
    { src = "https://github.com/akinsho/toggleterm.nvim", name = "toggleterm" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua", name = "tree" },
    { src = "https://github.com/neogitorg/neogit", name = "neogit" },
})

require("plugins.catppuccin")
require("plugins.mini_icons")
require("plugins.heirline")
require("plugins.fidget")
require("plugins.which_key")
require("plugins.arborist")
require("plugins.foldtext")
require("plugins.blink-pairs")
require("plugins.fzf-lua")
require("plugins.toggleterm")
require("plugins.tree")
require("plugins.neogit")

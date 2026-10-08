vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/nvim-mini/mini.icons", name = "mini.icons", version = "stable" },
    { src = "https://github.com/rebelot/heirline.nvim", name = "heirline" },
    { src = "https://github.com/ibhagwan/fzf-lua", name = "fzf-lua" },
    { src = "https://github.com/windwp/nvim-autopairs", name = "autopairs" },
    { src = "https://github.com/j-hui/fidget.nvim", name = "fidget" },
    { src = "https://github.com/folke/which-key.nvim", name = "which-key" },
    { src = "https://github.com/nvim-mini/mini.surround", name = "mini-surround" },
    { src = "https://github.com/f-person/git-blame.nvim", name = "git-blame" },
    { src = "https://github.com/arborist-ts/arborist.nvim", name = "arborist" },
    { src = "https://github.com/saghen/blink.indent", name = "blink-indent" },
    { src = "https://github.com/monkoose/matchparen.nvim", name = "matchparen" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context", name = "treesitter-context"},
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", name = "treesitter-text-object" },
    { src = "https://github.com/OXY2DEV/foldtext.nvim", name = "foldtext" },
    { src = "https://github.com/Bekaboo/dropbar.nvim", name = "dropbar" }
})

require("plugins.catppuccin")
require("plugins.mini-icons")
require("plugins.heirline")
require("plugins.fzf")
require("plugins.autopairs")
require("plugins.fidget")
require("plugins.which-key")
require("plugins.mini-surround")
require("plugins.git-blame")
require("plugins.arborist")
require("plugins.blink-indent")
require("plugins.matchparen")
require("plugins.treesitter-context")
require("plugins.treesitter-text-objects")
require("plugins.foldtext")
require("plugins.dropbar")

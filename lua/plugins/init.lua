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
    { src = "https://github.com/Saghen/blink.cmp", name = "blink-cmp", version = vim.version.range("1.*") },
    { src = "https://github.com/ibhagwan/fzf-lua", name = "fzf-lua" },
    { src = "https://github.com/akinsho/toggleterm.nvim", name = "toggleterm" },
    { src = "https://github.com/Jaffrez/nvim-tree.lua", name = "tree" },
    { src = "https://github.com/neogitorg/neogit", name = "neogit" },
    { src = "https://github.com/nvim-mini/mini.surround", name = "mini-surround" },
    { src = "https://github.com/mason-org/mason.nvim", name = "mason" },
    { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
    { src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
    { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim", name = "tiny-inline-diagnostic" },
    { src = "https://github.com/DrKJeff16/project.nvim", name = "project" },
    { src = "https://github.com/OXY2DEV/markview.nvim", name = "markview" },
    { src = "https://github.com/acidsugarx/babel.nvim", name = "babel" },
    { src = "https://github.com/mrcjkb/rustaceanvim", name = "rustaceanvim" },
})

require("plugins.catppuccin")
require("plugins.mini_icons")
require("plugins.heirline")
require("plugins.fidget")
require("plugins.which_key")
require("plugins.arborist")
require("plugins.foldtext")
require("plugins.blink_pairs")
require("plugins.fzf_lua")
require("plugins.toggleterm")
require("plugins.tree")
require("plugins.neogit")
require("plugins.mini_surround")
require("plugins.blink_cmp")
require("plugins.mason")
require("plugins.conform")
require("plugins.lsp")
require("plugins.lazydev")
require("plugins.tiny_inline_diagnostic")
require("plugins.project")
require("plugins.markview")
require("plugins.treesitter_context")
require("plugins.babel")

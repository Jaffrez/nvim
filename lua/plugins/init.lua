vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
	{ src = "https://github.com/rebelot/heirline.nvim", name = "heirline" },
	{ src = "https://github.com/nvim-mini/mini.icons", name = "mini.icons", version = "stable" },
	{ src = "https://github.com/j-hui/fidget.nvim", name = "fidget" },
	{ src = "https://github.com/mason-org/mason.nvim", name = "mason" },
	{ src = "https://github.com/neovim/nvim-lspconfig", name = "lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink.cmp", version = "v1.10.2" },
	{ src = "https://github.com/ibhagwan/fzf-lua", name = "fzf-lua" },
	{ src = "https://github.com/stevearc/conform.nvim", name = "conform" },
	{ src = "https://github.com/rafamadriz/friendly-snippets", name = "friendly-snippets" },
	{ src = "https://github.com/Bekaboo/dropbar.nvim", name = "dropbar" },
	{ src = "https://github.com/folke/snacks.nvim", name = "snacks" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" },
	{ src = "https://github.com/folke/which-key.nvim", name = "which-key" },
	{ src = "https://github.com/mrcjkb/rustaceanvim", name = "rustaceanvim" },
	{ src = "https://github.com/rachartier/tiny-cmdline.nvim", name = "tiny-cmdline" },
	{ src = "https://github.com/arborist-ts/arborist.nvim", name = "arborist" },
	{ src = "https://github.com/windwp/nvim-autopairs", name = "nvim-autopairs" },
	{ src = "https://github.com/ptdewey/pendulum-nvim", name = "pendulum" },
})

require("plugins.ui.colorscheme")
require("plugins.ui.mini-icons")
require("plugins.editor.git")
require("plugins.ui.heirline")
require("plugins.ui.fidget")

require("plugins.coding.mason")
require("plugins.coding.lsp")
require("plugins.coding.blink-cmp")
require("plugins.editor.fzf-lua")
require("plugins.coding.format")
require("plugins.ui.dropbar")
require("plugins.editor.snacks")
require("plugins.ui.which-key")
require("plugins.ui.tiny-cmdline")
require("plugins.editor.arborist")
require("plugins.editor.autopairs")
require("plugins.editor.pendulum")

require("plugins.keymaps")
require("plugins.disable")

require("mason").setup({})

local ensure_installed = {
    -- lsp
    "lua-language-server",
    "rust-analyzer",
    "clangd",
    "basedpyright",
    -- formatter
    "stylua",
    "ruff",
    "clang-format",
}

vim.api.nvim_create_user_command("MasonSync", function()
    local registry = require("mason-registry")

    registry.refresh(function()
        for _, name in ipairs(ensure_installed) do
            if not registry.has_package(name) then
                vim.notify("Mason: Unknown package " .. name, vim.log.levels.WARN)
            else
                local pkg = registry.get_package(name)

                if not pkg:is_installed() and not pkg:is_installing() then
                    pkg:install({}, function(success)
                        if not success then
                            vim.notify("Mason: Failed to install " .. name, vim.log.levels.ERROR)
                        end
                    end)
                end
            end
        end
    end)
end, {
    desc = "Install missing Mason packages",
})

vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Open Mason" })

return {
    {
        "folke/which-key.nvim",
        lazy = true,
        keys = {{"<leader>"}},
        config = function()
            require("which-key").setup {
                icons = {
                    separator = "􁉆 ",
                },
                window = {
                    border = "none",     -- none, single, double, shadow
                    position = "bottom", -- bottom, top
                },
                show_keys = false,
                show_help = false
            }
        end
    }
}

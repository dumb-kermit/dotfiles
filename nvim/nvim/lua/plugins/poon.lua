return {
    {
        "ThePrimeagen/harpoon",
        -- enabled = false,
        lazy = true,
        keys = {{"<leader>"}},
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.harpoon")
        end
    }
}

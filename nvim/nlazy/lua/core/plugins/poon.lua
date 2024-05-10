return {
    {
        "ThePrimeagen/harpoon",
        lazy = true,
        keys = {{"<S-f>"}},
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("config.harpoon")
        end
    }
}

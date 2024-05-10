return {
    { "j-hui/fidget.nvim",
        tag = "v1.0.0",
        enabled = false,
        event = "VeryLazy",
        config = function()
        require("config.spinner")
        end
    }
}

return {
    "mrs4ndman/theme-selector.nvim",
    cmd = { "Themer" },
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("theme-selector.colorschemes").list = {
            "tokyodark",
            "catppuccin",
            "gruvbox",
            "gruvbox-material",
            "oxocarbon",
            "moonbow",
            "palenightfall",
            "nordfox",
            "onedark",
            "tokyonight",
            "ayu",
            "ayu-mirage",
            "kanagawa-wave",
            "solarized",
            "melange",
            "moonlight",
            "rose-pine-dawn",
            "rose-pine-moon",
            "dawnfox",
            "everforest",
            "night-owl",
        }
        require "theme-selector"
    end,
}

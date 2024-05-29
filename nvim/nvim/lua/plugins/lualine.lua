return {
    {
        "freddiehaddad/feline.nvim",
        enabled = false,
        -- init = function()
        -- local ctp_feline = require "catppuccin.groups.integrations.feline"
        -- ctp_feline.setup()
        -- require("feline").setup {
        -- components = ctp_feline.get(),
        -- }
        -- end,
    },
    {
        "nvim-lualine/lualine.nvim",
        enabled = false,
        lazy = true,
        event = { "BufReadPost", "BufNewFile", "VeryLazy" },
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    --theme = "catppuccin",
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },

                    --section_separators = { left = "  ", right = "" },
                    --component_separators = { left = "", right = "" },
                    -- component_separators = { left = "┃", right = "┃" },

                    -- component_separators = { left = "│", right = "│" },
                    -- section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "filename",
                        {
                            "buffers",
                            show_filename_only = false, -- Shows shortened relative path when set to false.
                            hide_filename_extension = false, -- Hide filename extension when set to true.
                            show_modified_status = false, -- Shows indicator when the buffer is modified.

                            mode = 1,
                            -- 0: Shows buffer name
                            -- 1: Shows buffer index
                            -- 2: Shows buffer name + buffer index
                            -- 3: Shows buffer number
                            -- 4: Shows buffer name + buffer number

                            max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                            -- it can also be a function that returns
                            -- the value of `max_length` dynamically.
                            filetype_names = {
                                TelescopePrompt = "Telescope",
                                dashboard = "Dashboard",
                                packer = "Packer",
                                fzf = "FZF",
                                alpha = "Alpha",
                            }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

                            -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
                            use_mode_colors = true,

                            symbols = {
                                modified = "●", -- Text to show when the buffer is modified
                                alternate_file = "#", -- Text to show to identify the alternate file
                                directory = "", -- Text to show when the buffer is a directory
                            },
                        },
                    },
                    lualine_c = { "branch", "diff" },
                    lualine_x = { "harpoon2" },
                    lualine_y = { "diagnostics" },
                    lualine_z = { "location", { "datetime", style = "%r" } },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            }
        end,
    },
    -- { "itchyny/lightline.vim", lazy = false },
    {
        "letieu/harpoon-lualine",
    },
}

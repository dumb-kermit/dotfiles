return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        keys = {
            { "<leader>t", ":Neotree reveal<CR>", desc = "BRING NTREE" },
        },
        -- lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        opts = {
            close_if_last_window = true,
            popup_border_style = "rounded",
            default_component_configs = {
                container = {
                    enable_character_fade = false,
                },
                indent = {
                    indent_size = 2,
                    padding = 0, -- extra padding on left hand side
                    with_markers = true,
                    indent_marker = "┃",
                    last_indent_marker = "┗",
                    -- indent_marker = "│",
                    -- last_indent_marker = "└",
                },
                icon = {
                    -- folder_closed = "📁"
                    -- folder_open = "📂",
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    -- folder_closed = "􀈖 ",
                    -- folder_open = "􀈕 ",
                    -- folder_empty = "􀬕 ",
                },
                modified = {
                    symbol = "🗘",
                    --symbol = "*",
                    --symbol = "􁹠 ",
                },
                file_size = {
                    enabled = true,
                    required_width = 64, -- min width of window required to show this column
                },
                last_modified = {
                    enabled = true,
                    required_width = 88, -- min width of window required to show this column
                },
            },
            window = {
                position = "left",
                width = 30,
            },
            filesystem = {
                filtered_items = {
                    -- visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_hidden = false,
                },
                follow_current_file = {
                    enabled = false, -- This will find and focus the file in the active buffer every time
                    --               -- the current file is changed while the tree is open.
                    leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },
                group_empty_dirs = true,
            },
        },
    },
}

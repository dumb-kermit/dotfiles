return {
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
        keys = {
            {
                "<leader>b",
                "<cmd>Telescope file_browser grouped=true hide_parent_dir=true hidden=true path=%:p:h select_buffer=true<CR>",
                --"<cmd>Telescope file_browser grouped=true hide_parent_dir=true prompt_path=true dir_icon=􀈖  path=%:p:h select_buffer=true<CR>",
                desc = "SCOPE FINDER",
            },
            {
                "<leader>i",
                "<cmd>Telescope file_browser theme=ivy grouped=true hide_parent_dir=true prompt_path=true path=%:p:h select_buffer=true<CR>",
                desc = "SCOPE ULTRAFINDER",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        keys = { { "<leader>" } },
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable "make" == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "debugloop/telescope-undo.nvim" },
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        hidden = { file_browser = true, folder_browser = true },
                    },
                },
                defaults = {
                    preview = {
                        mime_hook = function(filepath, bufnr, opts)
                            local is_image = function(filepath)
                                local image_extensions = { "png", "jpg" } -- Supported image formats
                                local split_path = vim.split(filepath:lower(), ".", { plain = true })
                                local extension = split_path[#split_path]
                                return vim.tbl_contains(image_extensions, extension)
                            end
                            if is_image(filepath) then
                                local term = vim.api.nvim_open_term(bufnr, {})
                                local function send_output(_, data, _)
                                    for _, d in ipairs(data) do
                                        vim.api.nvim_chan_send(term, d .. "\r\n")
                                    end
                                end
                                vim.fn.jobstart({
                                    "catimg",
                                    filepath, -- Terminal image viewer command
                                }, {
                                    on_stdout = send_output,
                                    stdout_buffered = true,
                                    pty = true,
                                })
                            else
                                require("telescope.previewers.utils").set_preview_message(
                                    bufnr,
                                    opts.winid,
                                    "Binary cannot be previewed"
                                )
                            end
                        end,
                    },
                    border = true,
                    --borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
                    --borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    sorting_strategy = "descending",
                    selection_strategy = "reset",
                    prompt_position = "top",
                    --prompt_prefix = "􀊫  ",
                    --prompt_prefix = "",
                    prompt_prefix = "  ",
                    selection_caret = " ",
                    entry_prefix = " ",
                    --prompt_prefix = " • ",
                    --selection_caret = " • ",
                    --entry_prefix = " • ",
                    --entry_prefix = " ・ ",
                    path_display = { "smart" },
                    file_previewer = require("telescope.previewers").cat.new,
                    color_devicons = false,
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top", --top
                            preview_width = 0.68, --0.55
                            results_width = 0.88, --0.8
                        },
                        vertical = {
                            mirror = false, --false
                        },
                        width = 0.92, --0.87
                        height = 0.92, --0.80
                        preview_cutoff = 120, --120
                    },
                },
                -- defaults = {
                --   mappings = {
                --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                --   },
                -- },
                -- pickers = {}
                pickers = {
                    help_tags = {
                        mappings = {
                            i = {
                                ["<CR>"] = "file_vsplit",
                            },
                        },
                        colorscheme = {
                            enable_preview = true,
                        },
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true, -- false will only do exact matching
                            override_generic_sorter = true, -- override the generic sorter
                            override_file_sorter = true, -- override the file sorter
                            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        },
                        undo = {
                            use_delta = true,
                            use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
                            side_by_side = false,
                            diff_context_lines = vim.o.scrolloff,
                            entry_format = "state #$ID, $STAT, $TIME",
                            time_format = "",
                            saved_only = false,
                        },
                        file_browser = {
                            grouped = true,
                            hidden = { file_browser = true, folder_browser = true },
                            display_stat = { date = true, size = true, mode = false },
                        },
                        ["ui-select"] = {
                            require("telescope.themes").get_dropdown(),
                        },
                    },
                },
            }
            require "config.stelescope"
            require("telescope").load_extension "fzf"
            require("telescope").load_extension "ui-select"
            require("telescope").load_extension "undo"

            local builtin = require "telescope.builtin"
            vim.keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "SCOPE HELP" })
            vim.keymap.set("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "SCOPE KEYS" })
            vim.keymap.set("n", "<leader>s", "<cmd>Telescope<CR>", { desc = "SCOPE PICKERS" })
            vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "SCOPE CURWORD" })
            vim.keymap.set("n", "<leader>a", builtin.diagnostics, { desc = "SCOPE LSPDIAG" })
            vim.keymap.set("n", "<leader>c", builtin.marks, { desc = "SCOPE MARKS" })
            vim.keymap.set("n", "<leader><tab>", builtin.oldfiles, { desc = "SCOPE RECENT" })
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "SCOPE UNDO" })
            vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "SCOPE BUFFERS" })

            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set("n", "<leader>z", function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find {
                    winblend = 10,
                }
            end, { desc = "SCOPE FUZZY" })

            -- It's also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set("n", "<leader>g", function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                }
            end, { desc = "SCOPE GREP" })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set("n", "<leader>/", function()
                builtin.find_files { cwd = vim.fn.stdpath "config" }
            end, { desc = "SCOPE CONFIG" })
        end,
    },
}

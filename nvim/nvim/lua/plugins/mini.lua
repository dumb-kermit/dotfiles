return {
    {
        "echasnovski/mini.pairs",
        lazy = false,
        event = "InsertEnter",
        init = function()
            require("mini.pairs").setup()
        end,
    },
    -- {
    -- "echasnovski/mini.sessions",
    -- version = false,
    -- lazy = false,
    -- keys = {
    -- {
    -- "<leader>8",
    -- function()
    -- require("mini.sessions").select()
    -- end,
    -- desc = "Select Session",
    -- },
    -- {
    -- "<leader>7",
    -- function()
    -- require("mini.sessions").write "ss00"
    -- end,
    -- desc = "Save Session",
    -- },
    -- },
    -- opts = {
    -- autoread = true,
    -- autowrite = true,
    -- verbose = { read = true, write = true, delete = true },
    -- },
    -- init = function()
    -- require("mini.sessions").setup()
    -- end,
    -- },
    {
        "echasnovski/mini.diff",
        event = "VeryLazy",
        keys = {
            {
                "<leader>go",
                function()
                    require("mini.diff").toggle_overlay(0)
                end,
                desc = "Toggle mini.diff overlay",
            },
        },
        -- opts = {
        -- view = {
        -- style = 'sign',
        -- signs = {
        -- add = '▎',
        -- change = '▎',
        -- delete = '',
        -- },
        -- },
        -- },
        init = function()
            require "config.diff"
        end,
        -- local diff = require 'mini.diff'
        -- diff.setup { source = diff.gen_source.save() }
        -- diff.setup {
        -- view = {
        -- style = 'sign',
        -- signs = {
        -- add = '▎',
        -- change = '▎',
        -- delete = '',
        -- },
        -- },
        -- }
        -- end,
    },
    signs = { add = "+", change = "•", delete = "-" },
    -- },
    -- },
    -- },
    {
        "echasnovski/mini.indentscope",
        enabled = false,
        event = "LspAttach",
        init = function()
            local MiniIndentscope = require "mini.indentscope"
            require("mini.indentscope").setup {
                draw = {
                    animation = MiniIndentscope.gen_animation.exponential {
                        easing = "in",
                        duration = 100,
                        unit = "step",
                    },
                    delay = 100,
                },
                --symbol = "│",
                --symbol = "│",
                --symbol = '･',
                --symbol = '•',
                --symbol = '･',
                --symbol = "􁾬",
                --symbol = "𐫵",
                --symbol = '􀆈',
                --symbol = '􀓃',
                --symbol = '􀄩',
                --symbol = "•",
                --symbol = '╎',
                options = {
                    indent_at_cursor = false,
                    try_as_border = true,
                },
            }
        end,
    },
    -- { 'echasnovski/mini.colors', version = false, enabled = false },
    {
        "echasnovski/mini.cursorword",
        lazy = true,
        event = "VeryLazy",
        init = function()
            require("mini.cursorword").setup()
            vim.cmd "hi MiniCursorword cterm=none gui=none guifg=none"
        end,
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        enabled = false,
        init = function()
            require("mini.statusline").setup()
        end,
    },
    {
        "echasnovski/mini.animate",
        enabled = false,
        event = "VeryLazy",
        opts = function()
            -- don't use animate when scrolling with the mouse
            local mouse_scrolled = false
            for _, scroll in ipairs { "Up", "Down" } do
                local key = "<ScrollWheel" .. scroll .. ">"
                vim.keymap.set({ "", "i" }, key, function()
                    mouse_scrolled = true
                    return key
                end, { expr = true })
            end

            local animate = require "mini.animate"
            local is_not_single_window = function(win_id)
                local tabpage_id = vim.api.nvim_win_get_tabpage(win_id)
                return #vim.api.nvim_tabpage_list_wins(tabpage_id) > 1
            end
            return {
                cursor = {
                    timing = animate.gen_timing.exponential { easing = "in-out", duration = 2, unit = "step" },
                    path = animate.gen_path.line {
                        predicate = function()
                            return true
                        end,
                    },
                    --path = animate.gen_path.angle(),
                },
                resize = {
                    timing = animate.gen_timing.linear { duration = 100, unit = "total" },
                },
                open = {
                    -- Animate with wiping from nearest edge instead of default static one
                    -- and only if it is not a single window in tabpage
                    winconfig = animate.gen_winconfig.wipe {
                        predicate = is_not_single_window,
                        direction = "from_edge",
                    },
                },
                close = {
                    -- Animate with wiping to nearest edge instead of default static one
                    -- and only if it is not a single window in tabpage
                    winconfig = animate.gen_winconfig.wipe {
                        predicate = is_not_single_window,
                        direction = "to_edge",
                    },
                },
                scroll = {
                    timing = animate.gen_timing.linear { duration = 250, unit = "total" },
                    subscroll = animate.gen_subscroll.equal {
                        predicate = function(total_scroll)
                            if mouse_scrolled then
                                mouse_scrolled = false
                                return false
                            end
                            return total_scroll > 1
                        end,
                    },
                },
            }
        end,
    },
    {
        "echasnovski/mini.notify",
        event = "VeryLazy",
        -- enabled = false,
        init = function()
            require("mini.notify").setup()
            vim.notify = require("mini.notify").make_notify()
        end,
    },
}

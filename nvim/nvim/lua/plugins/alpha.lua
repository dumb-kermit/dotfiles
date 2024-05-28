return {
    "goolord/alpha-nvim",
    enabled = false,
    -- event = "VimEnter",
    -- dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        { "<leader>d", "<cmd>Alpha<CR>", desc = "BRING $ALPHA" },
    },
    lazy = false,
    priority = 1000,
    config = function()
        local alpha = require "alpha"
        local dashboard = require "alpha.themes.dashboard"
        -- It uses almost the same format as the "date" command in Linux (man date for info)
        local time = os.date "%_k:%M - %a - %b %d"
        local lazy = require "lazy"

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    lazy.show()
                end,
            })
        end

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = lazy.stats()
                local v = vim.version()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = {
                    -- "",
                    -- "",
                    "",
                    "       "
                        .. time
                        .. " ┃   v"
                        .. v.major
                        .. "."
                        .. v.minor
                        .. "."
                        .. v.patch
                        .. stats.loaded
                        .. " ┃ "
                        .. stats.count
                        .. " plugins ┃ "
                        .. ms
                        .. "ms ",
                    --| tk_neptune",
                    -- "   " .. stats.loaded .. " / " .. stats.count .. " plugins | " .. ms .. "ms | tk_neptune",
                    -- "",
                    --"󰽰 The phone is ringing, the world is spinning 󰽰",
                    --"               󰎈 Just let me out 󰎈",
                    -- "   󰽰 I tuck you in, warm within, keep you free from sin ... 󰽰",
                    -- "                 󰎈 'Til the Sandman, he comes 󰎈              ",
                    "",
                    "",
                    "",
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
        -- Header section config
        dashboard.section.header.val = {
            "                                                                                    ",
            "                                   N E O V I M                                      ",
            "                                                                                    ",
            "                                      ／|__                                         ",
            "                                     (o o /                                         ",
            "_____________________________________ |.   ~. _____________________________________ ",
            "                                      じしf_,)ノ                                    ",
            -- "                                                                                    ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("1", "  █  NEW FILE", "<cmd>ene<CR>"),
            --dashboard.button("o", "⚡   It's Oil time", "<cmd>Oil<CR>"),
            --dashboard.button("v", "    Source session", "<cmd>SessionRestore<CR>"),
            --dashboard.button("f", "󰈞    Find project file", "<cmd>Telescope find_files<CR>"),
            dashboard.button("2", "  █  RECENT", "<cmd>Telescope oldfiles<CR>"),
            --dashboard.button("g", "󰊄    Grep pattern", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("3", "󰏘  █  COLOURS", "<cmd>Themer<CR>"),
            dashboard.button("4", "󰒲  █  PLUGINS", "<cmd>Lazy<CR>"),
            dashboard.button("5", "  █  PROFILER", "<cmd>Lazy profile<CR>"),
            dashboard.button("6", "󰿅  █  QUITS", "<cmd>qa<CR>"),
        }

        alpha.setup(dashboard.opts)

        vim.cmd [[ autocmd Filetype alpha setlocal nofoldenable signcolumn=no nonumber norelativenumber ]]
    end,
}

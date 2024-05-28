return {
    {
        "echasnovski/mini.starter",
        -- enabled = false, -- wait till new 0.7.0 release to put it back on semver
        lazy = true,
        --keys = { { '<leader>' } },
        event = "VimEnter",
        opts = function()
            local logo = table.concat({
                "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
                "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
                "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
                "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
                "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
                "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
            }, "\n")
            local pad = string.rep(" ", 22)
            local new_section = function(name, action, section)
                return { name = name, action = action, section = pad .. section }
            end
            local dawg = table.concat({
                "                                                                       ",
                "                                                                     ",
                "       ████ ██████           █████      ██                     ",
                "      ███████████             █████                             ",
                "      █████████ ███████████████████ ███   ███████████   ",
                "     █████████  ███    █████████████ █████ ██████████████   ",
                "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
                "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
                " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
                "                                                                       ",
            }, "\n")

            local hola = "WELCOME BACK, MY FORTUNATE SON."

            local starter = require "mini.starter"
            local tab = table.concat({
                "                                                                                                                           ",
                "   &&     && &&&&&&&&& &&    &&&&&&&&&&&&           &&&&&&&&& &&&&&&&&& &&&&&&&&& &&&&&&&&&&&&&&&&&& &&&&&&&&& &&&&&&&&&   ",
                "   &&&& &&&&    &&&    &&&&  &&&    &&              &&           &&&          &&& &&    &&&    &&    &&&       &&     &&   ",
                "   && &&& &&    &&&    && && &&&    &&              &&&&&&&&&    &&&    &&&&&&&&& &&&&&&&&&    &&    &&&&&&&&& &&&&&&&&&   ",
                "   &&     &&    &&&    &&  &&&&&    &&                     &&    &&&    &&    &&& &&  &&&      &&    &&&       &&   &&     ",
                "   &&     && &&&&&&&&& &&    &&&&&&&&&&&&     &&    &&&&&&&&&    &&&    &&&&&&&&& &&    &&&    &&    &&&&&&&&& &&     &&   ",
                "                                                                                                                           ",
            }, "\n")
            local config = {
                evaluate_single = true,
                --header = dawg,
                --header = logo,
                -- header = hola,
                -- header = tab,
                items = {
                    starter.sections.recent_files(5, false),
                    --  new_section("BACKGROUND LIGHT", "set background=light", "BACKGROUND"),
                    --  new_section("BACKGROUND DARK", "set background=dark", "BACKGROUND"),
                    --	new_section("LOAD SCHEMES", "LCS Extra", "COLORSCOPE"),
                    --  new_section("Set Colours", "Telescope colorscheme", "Colorschemes"),
                    --	new_section("SWEETIE", "colorscheme sweetie", "TRUE COLORS"),
                    --new_section("Gruvbox", ":colorscheme gruvbox-material<CR>", "Pick Colors"),
                    --new_section("Melange", ":lua require('config.dmel')", "Quick Select"),
                    --new_section("Palenight", ":colorscheme palenight<CR>", "Pick Colors"),
                    --new_section("Miasma", "<cmd>colorscheme miasma<CR>", "Pick Colors"),
                    --new_section("Ayu", ":colorscheme ayu-dark<CR>", "Pick Colors"),
                    --new_section("Falcon", ":lua require('config.birb')", "Quick Select"),
                    --new_section("Moonbow", ":lua require('config.mbow')", "Quick Select"),
                    --new_section("Kanagawa", ":lua require('config.kanagawa')", "Quick Select"),
                    --	new_section("KANAGAWA DRAGON", "colorscheme kanagawa-dragon", "TRUE COLORS"),
                    --	new_section("DOOM-ONE", "colorscheme doom-one", "TRUE COLORS"),
                    --starter.sections.sessions(2, true),
                    starter.sections.telescope(),
                    starter.sections.builtin_actions(),
                    --new_section("Toggle Lazy", "Lazy", "NeoVim"),
                    --new_section("Quit App", "quit!", "NeoVim"),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet "• ",
                    --starter.gen_hook.adding_bullet "􀚀  ",
                    --starter.gen_hook.adding_bullet "░ ",
                    starter.gen_hook.indexing("all", { "Recent files", "Builtin actions", "Telescope" }),
                    starter.gen_hook.padding(6, 0),
                    starter.gen_hook.aligning("left", "center"),
                },
            }
            return config
        end,
        config = function(_, config)
            -- close Lazy and re-open when starter is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "MiniStarterOpened",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            local starter = require "mini.starter"
            starter.setup(config)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local pad_footer = string.rep(" ", 8)
                    starter.config.footer = pad_footer
                        .. "󰌵 NVIM STARTED WITH "
                        .. stats.count
                        .. " PLUGINS IN "
                        .. ms
                        .. "MS"
                    local stat = pad_footer .. "󰌵 NVIM STARTED WITH " .. stats.count .. " PLUGINS IN " .. ms .. "MS"
                    pcall(starter.refresh)
                end,
            })
        end,
    },
}

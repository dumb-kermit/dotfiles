return {
    {
        "shaunsingh/nord.nvim",
        -- lazy = true,
        -- init = function()
        -- vim.cmd "colorscheme nord"
        -- end,
    },
    {
        "pappasam/papercolor-theme-slim",
        -- init = function()
        -- vim.cmd "set background=light"
        -- vim.cmd "colorscheme papercolorslim"
        -- vim.cmd "hi LspReferenceWrite guibg=none"
        -- vim.cmd "hi LspReferenceRead guibg=none"
        -- vim.cmd "hi LspReferenceText guibg=none"
        -- vim.cmd "hi TelescopeBorder guifg=none"
        -- vim.cmd "hi TelescopeBorder guibg=#1C1C1C guifg=#1C1C1C"
        -- vim.cmd "hi lualine_b_buffers_inactive guibg=#689494 guifg=#1c1c1c"
        -- vim.cmd "hi CursorLineNr guifg=#E48256"
        -- vim.cmd "hi MiniDiffSignAdd guifg=#A4D800 guibg=#A4D800"
        -- vim.cmd "hi MiniDiffSignChange guifg=#3BB1DB guibg=#3BB1DB"
        -- vim.cmd "hi MiniDiffSignDelete guifg=#E48256 guibg=#E48256"
        -- vim.cmd "hi MiniDiffSignAdd guifg=#A4D800 guibg=none"
        -- vim.cmd "hi MiniDiffSignChange guifg=#3BB1DB guibg=none"
        -- vim.cmd "hi MiniDiffSignDelete guifg=#E48256 guibg=none"
        -- end,
    },
    {
        "rose-pine/neovim",
        -- lazy = false,
        name = "rose-pine",
        opts = {
            variant = "main", -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = false,

            enable = {
                terminal = false,
                legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },

            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },

            highlight_groups = {
                LspReferenceText = { bg = "none", underline = true },
                LspReferenceWrite = { bg = "none", underline = true },
                LspReferenceRead = { bg = "none", underline = true },
                TelescopeBorder = { bg = "#232136", fg = "#232136" },
                TelescopeNormal = { bg = "#232136" },
                Variables = { italic = true },
                --@variables.lua = { italic = true },
                Numbers = { underline = true },
                --@numbers.lua = { italic = true },
                Comment = { italic = true },
                --@comment.lua = { italic = true },
                -- Comment = { fg = "foam" },
                -- VertSplit = { fg = "muted", bg = "muted" },
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
                --
                -- Change palette colour
                -- if highlight.fg == palette.pine then
                --     highlight.fg = palette.foam
                -- end
            end,
        },
        -- init = function()
        -- config = function(_, opts)
        -- require("rose-pine").setup(opts)
        -- vim.cmd "colorscheme rose-pine-main"
        -- vim.cmd "hi @comment.lua cterm=italic"
        -- vim.cmd "hi @numbers.lua cterm=underline"
        -- vim.cmd "hi @variables.lua cterm=italic"
        -- end,
    },
    {
        "uloco/bluloco.nvim",
        -- lazy = false,
        -- priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            require("bluloco").setup {
                style = "light", -- "auto" | "dark" | "light"
                transparent = true,
                italics = true,
                terminal = vim.fn.has "gui_running" == 1,
                guicursor = true,
            }
            -- vim.cmd "colorscheme bluloco"
            -- vim.cmd "hi LspReferenceWrite guibg=none"
            -- vim.cmd "hi LspReferenceRead guibg=none"
            -- vim.cmd "hi LspReferenceText guibg=none"
            -- vim.cmd "hi TelescopeBorder guibg=#FAFAFA guifg=#FAFAFA"
            -- vim.cmd "hi TelescopeNormal guibg=#FAFAFA"
        end,
    },
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        -- priority = 1000,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            light_style = "day", -- The theme is used when the background is set to light
            transparent = true, -- Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = { italic = true },
                variables = { italic = true },
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "transparent", -- style for sidebars, see below
                floats = "transparent", -- style for floating windows
            },
            sidebars = { "qf", "help", "lazy", "mini.notify", "mininotify" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
            day_brightness = 1.0, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
            hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
            dim_inactive = false, -- dims inactive windows
            lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors) end,
            --- You can override specific highlights to use other groups or a hex color
            --- function will be called with a Highlights and ColorScheme table
            ---@param highlights Highlights
            ---@param colors ColorScheme
            -- on_highlights = function(highlights, colors) end,
            on_highlights = function(highlights, colors)
                local prompt = "#2d3149"
                highlights.TelescopeNormal = {
                    bg = colors.bg_dark,
                    fg = colors.fg_dark,
                }
                highlights.TelescopeBorder = {
                    bg = colors.bg_dark,
                    fg = colors.bg_dark,
                }
                highlights.TelescopePromptNormal = {
                    bg = prompt,
                }
                highlights.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                highlights.TelescopePromptTitle = {
                    bg = prompt,
                    fg = prompt,
                }
                highlights.TelescopePreviewTitle = {
                    bg = colors.bg_dark,
                    fg = colors.bg_dark,
                }
                highlights.TelescopeResultsTitle = {
                    bg = colors.bg_dark,
                    -- fg = colors.bg_dark,
                }
                highlights.LspReferenceRead = {
                    bg = colors.none,
                    -- fg = colors.bg_dark,
                }
                highlights.LspReferenceWrite = {
                    bg = colors.none,
                    -- fg = colors.bg_dark,
                }
                highlights.LspReferenceText = {
                    bg = colors.none,
                    -- fg = colors.bg_dark,
                }
            end,
        },
        -- config = function()
        -- load the colorscheme here
        -- vim.cmd [[colorscheme tokyonight-day]]
        -- vim.cmd "hi LspReferenceText guibg=none gui=underline cterm=underline"
        -- vim.cmd "hi LspReferenceWrite guibg=none gui=underline cterm=underline"
        -- vim.cmd "hi LspReferenceRead guibg=none gui=underline cterm=underline"
        -- end,
        -- init = function()
        -- vim.cmd "set background=dark"
        -- vim.cmd "colorscheme tokyonight-storm"
        -- vim.cmd "hi LspReferenceText guibg=none gui=underline cterm=underline"
        -- vim.cmd "hi LspReferenceWrite guibg=none gui=underline cterm=underline"
        -- vim.cmd "hi LspReferenceRead guibg=none gui=underline cterm=underline"
        -- vim.cmd "let g:lightline = {'colorscheme': 'tokyonight'}"
        -- vim.cmd "hi LspReferenceText guibg=none"
        -- vim.cmd "hi LspReferenceWrite guibg=none"
        -- vim.cmd "hi LspReferenceRead guibg=none"
        -- end,
    },
    {
        "sainnhe/everforest",
        -- init = function()
        -- vim.g.everforest_background = "soft"
        -- vim.g.everforest_ui_contrast = "high"
        -- vim.g.everforest_show_eob = 0
        -- vim.g.everforest_float_style = "dim"
        -- vim.g.everforest_enable_italic = true
        -- vim.g.everforest_current_word = "underline"
        -- vim.g.spring_night_high_contrast = 0
        -- vim.cmd "set background=light"
        -- vim.cmd "colorscheme everforest"
        -- end,
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = true,
        init = function()
            vim.cmd "set background=dark"
            vim.cmd "colorscheme oxocarbon"
            vim.cmd "hi MiniNotifyNormal guibg=#161616"
            vim.cmd "hi MiniNotifyBorder guibg=#161616 guifg=#FF74B8"
            vim.cmd "hi LspReferenceText guibg=none gui=underline cterm=underline"
            vim.cmd "hi LspReferenceWrite guibg=none gui=underline cterm=underline"
            vim.cmd "hi LspReferenceRead guibg=none gui=underline cterm=underline"
            vim.cmd "highlight MiniDiffSignAdd guifg=#BE95FF"
            vim.cmd "highlight MiniDiffSignChange guifg=#3EDBD9"
            vim.cmd "highlight MiniDiffSignDelete guifg=#EE5396"
            vim.cmd "hi TelescopeMatching guifg=#FF74B8 guibg=#141414"
            vim.cmd "hi TelescopeSelection guifg=#FF74B8 guibg=#141414"
            vim.cmd "hi TelescopeSelectionCaret guifg=#FF74B8 guibg=#141414"
            vim.cmd "hi TelescopePromptPrefix guifg=#FF74B8 guibg=#141414"
            vim.cmd "hi TelescopePromptCounter guifg=#FF74B8"
            vim.cmd "hi TelescopeResultsTitle guifg=#141414 guibg=#2CF9ED"
            -- vim.cmd "hi TelescopePromptTitle guifg=#393939 guibg=#393939"
            vim.cmd "hi TelescopePromptTitle guibg=#141414 guifg=#141414"
            vim.cmd "hi TelescopePromptBorder guibg=#141414 guifg=#141414"
            vim.cmd "hi TelescopePromptNormal guibg=#141414"
            -- vim.cmd "hi WhichkeySeparator guifg=#FF74B8"
            vim.cmd "hi WhichKeyFloat guibg=#161616"
            vim.cmd "hi WhichKeyDesc guifg=#C693FF"
            vim.cmd "hi CursorLineNR guifg=#C693FF"

            -- vim.cmd "hi TelescopeSelection guifg=#EE5396 guibg=#161616"
            -- vim.cmd "hi TelescopeSelectionCaret guifg=#EE5396 guibg=#161616"

            -- vim.cmd "hi TelescopePromptBorder guifg=#161616 guibg=#161616"
            -- vim.cmd "hi TelescopeBorder guifg=#161616 guibg=#161616"
            -- vim.cmd "hi TelescopePromptPrefix guifg=#EE5396 guibg=#161616"
            -- vim.cmd "hi TelescopeSelectionCaret guibg=#161616 guifg=#161616"
            -- vim.cmd "hi TelescopeResultsTitle guibg=#161616 guifg=#161616"
            -- vim.cmd "hi TelescopePromptTitle guibg=#161616 guifg=#161616"
            -- vim.cmd "hi TelescopePromptNormal guibg=#161616 guifg=#EE5396"
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- lazy = false,
        opts = {
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = "macchiato",
            },
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = true, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = { "italic" },
                keywords = { "italic" },
                strings = {},
                -- variables = { "italic" },
                numbers = { "italic" },
                --booleans = { "italic" },
                properties = {},
                types = {},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            color_overrides = {
                mocharrr = {
                    --base = "#252837",
                    base = "#25283B",
                    mantle = "#232534",
                    surface0 = "#343A51",
                    surface1 = "#2b2f40",
                    surface2 = "#2e2e41",
                    text = "#a6accd",
                    rosewater = "#b6bdca",
                    lavender = "#c8ccd4",
                    red = "#ff5370",
                    peach = "#f78c6c",
                    yellow = "#ffcb6b",
                    green = "#c3e88d",
                    teal = "#89ddff",
                    blue = "#82aaff",
                    mauve = "#D49BFD",
                    flamingo = "#ffcb6b",

                    -- now patching extra palettes
                    maroon = "#e06c75",
                    sky = "#f07178",

                    -- extra colors not decided what to do
                    pink = "#D49BFE",
                    sapphire = "#74C7EC",

                    subtext1 = "#BAC2DE",
                    subtext0 = "#A6ADC8",
                    overlay2 = "#9399B2",
                    overlay1 = "#7F849C",
                    overlay0 = "#6C7086",

                    crust = "#11111B",
                },
                td = {
                    base = "#11121d",
                    mantle = "#232534",
                    rosewater = "#FF8F4C",
                    surface0 = "#343A51",
                    surface1 = "#2b2f40",
                    surface2 = "#2e2e41",
                    -- text = "#FF8F4C",
                    text = "#a0a8cd",
                    -- rosewater = "#a0a8cd",
                    lavender = "#a0a8cd",
                    red = "#ee6d85",
                    peach = "#d7a65f",
                    yellow = "#d7a65f",
                    green = "#95c561",
                    teal = "#38a89d",
                    blue = "#7199ee",
                    mauve = "#ee6d85",
                    flamingo = "#D98454",

                    -- now patching extra palettes
                    maroon = "#EB6C84",
                    sky = "#FF8F4C",
                    --sky = "#9DA4C8",
                },
            },
            custom_highlights = function(colors)
                return {
                    LspReferenceText = { bg = "none" },
                    LspReferenceWrite = { bg = "none" },
                    LspReferenceRead = { bg = "none" },
                    -- LspReferenceText = { bg = "none", underline = true },
                    -- LspReferenceWrite = { bg = "none", underline = true },
                    -- LspReferenceRead = { bg = "none", underline = true },
                    -- CursorLine = { bg = "#41445A" },
                    -- WhichKeyFloat = { bg = "#303447" }
                }
            end,
            default_integrations = true,
            integrations = {
                cmp = true,
                dashboard = true,
                harpoon = true,
                gitsigns = true,
                leap = true,
                mason = true,
                --lightline = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = {},
                        hints = {},
                        warnings = {},
                        information = {},
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                semantic_tokens = false,
                treesitter = true,
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                which_key = true,
                nvimtree = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        },
        -- init = function()
        -- vim.cmd "set background=dark"
        -- LspReferenceText = { bg = "none", italic = true }
        -- LspReferenceWrite = { bg = "none", italic = true }
        -- vim.cmd "hi TelescopePromptNormal guibg=#3B3F53"
        -- vim.cmd "hi TelescopePromptBorder guibg=#3B3F53 guifg=#3B3F53"
        -- vim.cmd "hi TelescopePromptTitle guibg=#3B3F53 guifg=#3B3F53"
        -- vim.cmd "hi CursorLine guibg=#41445A"
        -- vim.cmd "hi TelescopePromptPrefix guifg=#E5C891"
        -- vim.cmd.colorscheme "catppuccin"
        -- end,
    },
    {
        "tiagovla/tokyodark.nvim",
        -- lazy = false,
        -- priority = 1000,
        opts = {
            transparent_background = true, -- set background to transparent
            gamma = 1.240, -- adjust the brightness of the theme
            --gamma = 0.722,
            -- gamma = 1.00,
            styles = {
                comments = { italic = true }, -- style for comments
                keywords = { italic = true }, -- style for keywords
                identifiers = { italic = true }, -- style for identifiers
                functions = { italic = true }, -- style for functions
                variables = { underline = true }, -- style for variables
            },
            custom_highlights = {} or function(highlights, palette)
                return {}
            end, -- extend highlights
            custom_palette = {} or function(palette)
                return {}
            end, -- extend palette
            terminal_colors = false, -- enable terminal colors
        },
        -- config = function(_, opts)
        -- require("tokyodark").setup(opts) -- calling setup is optional
        -- vim.cmd "colorscheme tokyodark"
        -- vim.cmd "hi LspReferenceWrite guibg=none"
        -- vim.cmd "hi LspReferenceRead guibg=none"
        -- vim.cmd "hi LspReferenceText guibg=none"
        -- vim.cmd "hi TelescopeBorder guifg=none"
        -- vim.cmd "hi TelescopeBorder guibg=#11121D guifg=#11121D"
        -- vim.cmd "hi TelescopePromptPrefix guifg=#F7A56F"
        -- end,
    },
    {
        "EdenEast/nightfox.nvim",
        opts = {
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath "cache" .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = false, -- Disable setting background
                terminal_colors = false, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false, -- Non focused panes set to alternative background
                module_default = true, -- Default enable value for modules
                colorblind = {
                    enable = false, -- Enable colorblind support
                    simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                    severity = {
                        protan = 0, -- Severity [0,1] for protan (red)
                        deutan = 0, -- Severity [0,1] for deutan (green)
                        tritan = 0, -- Severity [0,1] for tritan (blue)
                    },
                },
                styles = { -- Style to be applied to different syntax groups
                    comments = "italic", -- Value is any valid attr-list value `:help attr-list`
                    conditionals = "italic",
                    constants = "italic",
                    functions = "NONE",
                    keywords = "NONE",
                    numbers = "italic",
                    operators = "italic",
                    strings = "italic",
                    types = "NONE",
                    variables = "NONE",
                },
                inverse = { -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                modules = { -- List of various plugins and additional options
                    "cmp",
                    "mini",
                    "native_lsp",
                    "notify",
                    "telescope",
                    "treesitter",
                    "whichkey",
                    "leap",
                },
            },
            palettes = {},
            specs = {},
            groups = {
                all = {
                    LspReferenceText = { bg = "none" },
                    LspReferenceWrite = { bg = "none" },
                    LspReferenceRead = { bg = "none" },
                },
            },
        },
        -- init = function()
        -- vim.cmd "colorscheme nordfox"
        -- vim.g.lightline = { colorscheme = "nordfox" }
        -- end,
    },
    {
        "savq/melange-nvim",
        lazy = true,
        -- init = function()
        -- vim.cmd "colorscheme melange"
        -- end,
    },
    {
        "rebelot/kanagawa.nvim",
        --lazy = false
        --priority = 1000,
        opts = {
            compile = false,
            undercurl = false, -- enable undercurls 25273A
            commentStyle = { italic = true },
            functionStyle = { italic = true },
            keywordStyle = { italic = true },
            statementStyle = { italic = true },
            typeStyle = { italic = true },
            transparent = false, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            theme = "wave",
            colors = { -- add/modify theme and palette colors
                palette = {},
                theme = {
                    wave = {},
                    lotus = {},
                    dragon = {},
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    WhichKey = { fg = "#8EBC61" },
                    TelescopeSelection = { fg = "#EDC17A", bg = "none" },
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },
                    lualine_c_normal = { bg = "#000000" },
                    lualine_b_normal = { bg = "#000000" },
                    lualine_b_insert = { bg = "#000000" },
                    lualine_c_insert = { bg = "#000000" },
                    lualine_c_diagnostics_hint_normal = { bg = "#000000" },
                    lualine_c_diagnostics_info_normal = { bg = "#000000" },
                    lualine_c_diff_added_normal = { bg = "#000000" },
                    lualine_c_diff_modified_normal = { bg = "#000000" },
                    lualine_c_diff_removed_normal = { bg = "#000000" },
                    lualine_c_diff_added_insert = { bg = "#000000" },
                    lualine_c_diff_modified_insert = { bg = "#000000" },
                    lualine_c_diff_removed_insert = { bg = "#000000" },
                    LspReferenceText = { bg = "none", italic = true },
                    LspReferenceWrite = { bg = "none", italic = true },
                }
            end,
        },
        -- init = function()
        -- vim.cmd "set background=dark"
        -- vim.cmd.colorscheme "kanagawa-wave"
        -- end,
    },
    {
        "sainnhe/gruvbox-material",
        -- lazy = false,
        -- priority = 1000,
        -- init = function()
        -- vim.cmd "let g:gruvbox_material_background='medium'"
        -- vim.cmd "let g:gruvbox_material_foreground='material'"
        -- vim.cmd "let g:gruvbox_material_enable_italic=1"
        -- vim.cmd "let g:gruvbox_material_ui_contrast='low'"
        -- vim.cmd "let g:gruvbox_material_cursor='purple'"
        -- vim.cmd "let g:gruvbox_material_diagnostic_virtual_text='grey'"
        -- vim.cmd "let g:gruvbox_material_current_word='bold'"
        -- vim.cmd "let g:gruvbox_material_float_style='dim'"
        -- vim.cmd "let g:gruvbox_material_transparent_background=2"
        -- vim.cmd "let g:gruvbox_material_disable_terminal_colors=1"
        -- vim.cmd "let g:gruvbox_material_enable_bold=1"
        -- vim.cmd "let g:gruvbox_material_show_eob=0"
        -- vim.cmd "let g:gruvbox_material_statusline_style='original'"
        -- vim.cmd "let g:gruvbox_material_better_performance=1"
        -- vim.cmd "set background=dark"
        -- vim.cmd "colorscheme gruvbox-material"
        -- vim.cmd "hi Normal guibg=#252523"

        -- vim.cmd "let g:lightline = {'colorscheme' : 'gruvbox_material'}"
        -- vim.cmd "hi TelescopeMatching guifg=#FB4934 guibg=none"
        -- vim.cmd "hi TelescopeSelection guifg=#FB4934 guibg=none"
        -- vim.cmd "hi TelescopeSelectionCaret guifg=#FB4934 guibg=none"
        -- vim.cmd "hi TelescopeMatching guifg=none guibg=none"
        -- vim.cmd "hi TelescopeSelection guifg=#E1C6A0 guibg=#32302E"
        -- vim.cmd "hi TelescopeSelectionCaret guifg=none guibg=none"
        -- vim.cmd "hi TelescopePromptPrefix guifg=#282828 guibg=none"
        -- vim.cmd "hi TelescopeResultsTitle guifg=#282828 guibg=#282828"
        -- vim.cmd "hi TelescopeNormal guibg=none"
        -- vim.cmd "hi TelescopeTitle guifg=#252523 guibg=#FB4934"
        -- vim.cmd "hi TelescopePreviewTitle guibg=#282828 guifg=#282828"
        --
        -- vim.cmd "hi TelescopeBorder guifg=#282828 guibg=#282828"
        -- vim.cmd "hi TelescopePromptNormal guibg=#323232"
        -- vim.cmd "hi TelescopePromptBorder guibg=#323232 guifg=#323232"
        -- vim.cmd "hi TelescopePromptTitle guibg=#323232 guifg=#323232"
        -- vim.cmd "hi TelescopeSelection guibg=none guifg=#FABD2E"
        -- vim.cmd "hi TelescopePromptPrefix guifg=#FABD2E"
        -- vim.cmd "hi TelescopeSelectionCaret guifg=#FABD2E"
        -- vim.cmd "hi TelescopeMatching guibg=none guifg=#FABD2E"
        -- vim.cmd "hi WhichKeyFloat guibg=#282828"
        -- vim.cmd "hi WhichKeyBorder guibg=#252523 guifg=#E9B144"
        -- vim.cmd "hi WhichKey guifg=#E9B144"
        -- vim.cmd "hi MiniNotifyNormal guibg=#252523"
        -- vim.cmd "hi MiniNotifyBorder guibg=#252523"
        -- vim.cmd "hi MiniDiffSignAdd guifg=#B1B846"
        -- vim.cmd "hi MiniDiffSignChange guifg=#E9B144"
        -- vim.cmd "hi MiniDiffSignDelete guifg=#F25A4B"
        -- vim.cmd "hi WhichkeyDesc guifg=#B8BB26"
        -- vim.cmd "hi MiniStatuslineDevinfo guibg=#E9B143 guifg=#222222"
        -- vim.cmd "hi MiniStatuslineFilename guibg=#E9B143 guifg=#222222"
        -- vim.cmd "hi MiniStatuslineFileInfo guibg=#E9B143 guifg=#222222"
        -- vim.cmd "hi MiniStatuslineModeNormal guibg=#D3869B guifg=#222222"
        -- vim.cmd "hi MiniStatuslineModeInsert guibg=#F2594B guifg=#222222"
        -- vim.cmd "hi MiniStatuslineModeCommand guibg=#80AA9E guifg=#222222"
        -- end,
    },
    {
        "Shatur/neovim-ayu",
        lazy = true,
        -- init = function()
        -- vim.cmd "colorscheme ayu"
        -- vim.cmd "hi LspReferenceWrite guibg=none"
        -- vim.cmd "hi LspReferenceRead guibg=none"
        -- vim.cmd "hi LspReferenceText guibg=none"
        -- vim.cmd "hi TelescopePreviewBorder guifg=#FAFAFA guibg=#FAFAFA"
        -- vim.cmd "hi TelescopeResultsBorder guifg=#FAFAFA guibg=#FAFAFA"
        -- end,
    },
    {
        "olimorris/onedarkpro.nvim",
        enabled = false,
        -- lazy = false,
        -- priority = 1000,
        -- init = function()
        -- vim.cmd "colorscheme onedark_dark"
        -- end,
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        opts = {
            -- Main options --
            style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false, -- Show/hide backgroun:hd
            term_colors = true, -- Change terminal color as per the selected theme style
            ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
            cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
            -- toggle theme style ---
            toggle_style_key = "<leader>9", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
            toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
            -- Change code style ---
            -- Options are italic, bold, underline, none
            -- You can  configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
            code_style = {
                comments = "italic",
                keywords = "italic",
                functions = "bold",
                strings = "underline",
                variables = "bold",
            },
            -- Lualine options --
            lualine = {
                transparent = false, -- lualine center bar transparency
            },
            -- Custom Highlights --
            colors = {}, -- Override default colors
            highlights = {
                TelescopeBorder = { fg = "#C49060" },
                TelescopePreviewBorder = { fg = "#C49060" },
                FoldColumn = { bg = "none" },
                MiniNotifyNormal = { bg = "none" },
                MiniNotifyBorder = { bg = "none" },
                MiniNotify = { bg = "none" },
            }, -- Override highlight groups
            -- Plugins Config --
            diagnostics = {
                darker = false, -- darker colors for diagnostic
                undercurl = false, -- use undercurl instead of underline for diagnostics
                background = false, -- use background color for virtual text
            },
        },
        -- init = function()
        -- vim.cmd "colorscheme onedark"
        -- end,
    },
    {
        "arturgoms/moonbow.nvim",
        -- lazy = false,
        priority = 1000,
        config = function()
            require("moonbow").setup {
                undercurl = false,
                underline = true,
                bold = false,
                italic = true,
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = false,
                contrast = "hard",
                -- palette_overrides = {
                -- bg = "#000000",
                -- dark0_hard = "#000000",
                -- },
                overrides = {
                    FoldColumn = { bg = "none" },
                    SignColumn = { bg = "none" },
                    Number = { italic = true },
                    Boolean = { italic = true },
                    TelescopePreviewBorder = { fg = "#0A0E14", bg = "#0A0E14" },
                    TelescopeResultsBorder = { fg = "#0A0E14", bg = "#0A0E14" },
                    TelescopePromptBorder = { fg = "#282828", bg = "#282828" },
                    TelescopePromptNormal = { bg = "#282828" },
                    TelescopePromptTitle = { fg = "#282828", bg = "#282828" },
                    MiniStatuslineModeNormal = { fg = "#090E15", bg = "#FFBA00" },
                    MiniStatuslineModeInsert = { fg = "#090E15", bg = "#FF7600" },
                    MiniStatuslineFilename = { fg = "#090E15", bg = "#524944" },
                    MiniStarterItemPrefix = { fg = "#B8BB00" },
                    MiniStarterItemBullet = { bg = "#090E15", fg = "#090E15" },
                    ChangesSignTextAdd = { fg = "#B8BB00", bg = "none" },
                    ChangesSignTextDel = { fg = "#FF7600", bg = "none" },
                    ChangesSignTextCh = { fg = "#0F85FF", bg = "none" },
                    CursorLine = { bg = "#282828" },
                    TelescopeBorder = { fg = "#0A0E14", bg = "#0A0E14" },
                    TelescopeTitle = { fg = "none", bg = "none" },
                    TelescopePromptPrefix = { fg = "#83A598" },
                    TelescopeSelection = { fg = "#83A598", bg = "none" },
                    TelescopeMatching = { fg = "#83A598", bg = "none" },
                    TelescopeSelectionCaret = { fg = "#83A598", bg = "none" },
                },
                dim_inactive = false,
                transparent_mode = true,
            }
        end,
        -- init = function()
        -- vim.cmd "colorscheme moonbow"
        -- end,
    },
    {
        "JoosepAlviste/palenightfall.nvim",
        lazy = true,
        -- init = function()
        -- vim.o.background = "dark" -- or 'light'
        -- vim.cmd.colorscheme "palenightfall"
        -- vim.cmd "hi TelescopeBorder guifg=#EABA65 guibg=none"
        -- vim.cmd "hi TelescopePromptBorder guifg=#EABA65 guibg=none"
        -- vim.cmd "hi TelescopeMatching guifg=#F78C6C guibg=none"
        -- vim.cmd "hi TelescopeSelection guifg=#F78C6C guibg=none"
        -- vim.cmd "hi TelescopeSelectionCaret guifg=#F78C6C guibg=none"
        -- vim.cmd "hi TelescopePromptNormal guibg=none"
        -- vim.cmd "hi TelescopePromptPrefix guifg=#F78C6C guibg=none"
        -- vim.cmd "hi MiniNotifyBorder guifg=#C3E88D guibg=none"
        -- vim.cmd "hi MiniNotifyNormal guifg=#89DDFF guibg=none"
        -- vim.cmd "hi MiniNotify guifg=#89DDFF guibg=none"
        -- vim.cmd "hi WhichKeyDesc guifg=#F78C6C guibg=none"
        -- vim.cmd "hi WhichKey guifg=#C3E88D guibg=none"
        -- vim.cmd "hi MiniStatuslineFilename guibg=#89DDFF guifg=#000000"
        -- vim.cmd "hi MiniStatuslineFileInfo guibg=#89DDFF guifg=#000000"
        -- vim.cmd "hi MiniStatuslineDevinfo guibg=#89DDFF guifg=#000000"
        -- vim.cmd "hi MiniStatuslineModeNormal guibg=#FFCB6B guifg=#000000"
        -- vim.cmd "hi MiniStatuslineModeInsert guibg=#C3E88D guifg=#000000"
        -- end,
    },
    {
        "maxmx03/solarized.nvim",
        -- lazy = false,
        -- priority = 1000,
        config = function()
            require("solarized").setup {
                transparent = true, -- enable transparent background
                palette = "solarized",
                styles = {
                    comments = { italic = true },
                    functions = {},
                    variables = { italic = true },
                    numbers = { italic = true },
                    constants = { underline = true },
                    parameters = {},
                    keywords = {},
                    types = { italic = true },
                },
                enables = {
                    cmp = true,
                    lsp = true,
                    --semantic = true,
                    syntax = true,
                    telescope = true,
                    treesitter = true,
                    todo = true,
                    whichkey = true,
                    mini = true,
                },
                highlights = function(colors)
                    return {
                        -- LspReferenceText = { bg = "none", underline = true },
                        -- LspReferenceWrite = { bg = "none", underline = true },
                        -- LspReferenceRead = { bg = "none", underline = true },
                        WhichKeySeparator = { fg = "#DC3E00" },
                        -- MiniNotifyBorder = { bg = "none", fg = "#809A00" },
                        TelescopePromptPrefix = { fg = "#DC3E00" },
                        -- MiniStatuslineModeInsert = { bg = "#809A00", fg = "#002C38" },
                        -- MiniStatuslineModeNormal = { bg = "#008DD8", fg = "#002C38" },
                        -- MiniStatuslineFilename = { bg = "#93a1a1", fg = "#002C38" },
                        TelescopeSelection = { fg = "#DC3E00", bg = "none" },
                        -- TelescopeBorder = { bg = "none", fg = "none" },
                        TelescopeSelectionCaret = { fg = "#DC3E00", bg = "none" },
                        -- LspSignatureActiveParameter = { bg = "none" },
                        TelescopeMatching = { bg = "none", fg = "#DC3E00" },
                        SignColumn = { bg = "none" },
                        LineNr = { bg = "none" },
                    }
                end,
                colors = {},
                --theme = "default",
                theme = "neo", -- or 'neo'
                autocmd = true,
            }
        end,
        -- init = function()
        -- vim.o.background = "dark" -- or 'light'
        -- vim.cmd.colorscheme "solarized"
        -- vim.cmd "let g:lightline = {'colorscheme': 'solarized'}"
        -- vim.cmd "hi LspReferenceWrite guibg=none"
        -- vim.cmd "hi LspReferenceRead guibg=none"
        -- vim.cmd "hi LspReferenceText guibg=none"
        -- vim.cmd "hi Cursorline cterm=underline gui=underline guifg=#D79921"
        -- end,
    },
    {
        "shaunsingh/moonlight.nvim",
        -- lazy = false,
        --priority = 1000,
        config = function()
            vim.g.moonlight_italic_comments = true
            vim.g.moonlight_italic_keywords = true
            vim.g.moonlight_italic_functions = true
            vim.g.moonlight_italic_variables = true
            vim.g.moonlight_contrast = false
            vim.g.moonlight_borders = true
            vim.g.moonlight_disable_background = true
        end,
        -- init = function()
        -- vim.o.background = "dark" -- or 'light'
        -- vim.cmd "colorscheme moonlight"
        -- vim.cmd "hi TelescopeMatching guibg=none guifg=#F77F81"
        -- vim.cmd "hi TelescopeSelection guibg=none guifg=#F77F81"
        -- vim.cmd "hi TelescopeSelectionCaret guibg=none guifg=#F77F81"
        -- vim.cmd "hi TelescopePromptPrefix guibg=none guifg=#F77F81"
        -- vim.cmd "highlight MiniDiffSignAdd guifg=#FFC777"
        -- vim.cmd "highlight MiniDiffSignChange guifg=#2BF5C0"
        -- vim.cmd "highlight MiniDiffSignDelete guifg=#F77F81"
        -- vim.cmd "hi WhichKeyDesc guifg=#FFC777"
        -- require"config.mlight"
        -- end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        -- lazy = false,
        -- priority = 1000,
        opts = {
            terminal_colors = false, -- add neovim terminal colors
            undercurl = false,
            underline = true,
            bold = false,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = true,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {
                FoldColumn = { bg = "none" },
                SignColumn = { bg = "none" },
                CursorLineNr = { bg = "none" },
                -- NoiceCmdlinePopupTitle = { bg = "#1D2021" },
                -- NoiceCmdlinePopupBorder = { bg = "#1D2021" },
                -- NoiceCmdlineIconCmdline = { bg = "#1D2021" },
                -- NoiceCmdlineIconHelp = { bg = "#1D2021" },
                -- NoiceCmdlineIconLua = { bg = "#1D2021" },
                NoiceCmdlinePopupTitle = { bg = "none" },
                NoiceCmdlinePopupBorder = { bg = "none" },
                NoiceCmdlineIconCmdline = { bg = "none" },
                NoiceCmdlineIconHelp = { bg = "none" },
                NoiceCmdlineIconLua = { bg = "none" },
                EndofBuffer = { bg = "none", fg = "none" },
                --MiniStarterItemPrefix = { fg = '#B2B600' },
                --MiniStarterItemBullet = { fg = '#EC6D01' },
                MiniNotifyNormal = { fg = "#77A395", bg = "none" },
                MiniNotifyBorder = { fg = "#FFB600", bg = "none" },
                --EndOfBuffer = { bg = '#32302E', fg = '#32302E' },
                TelescopePromptPrefix = { fg = "#FFB600" },
                TelescopeMatching = { fg = "#FFB600" },
                TelescopeSelection = { fg = "#FFB600" },
                TelescopeSelectionCaret = { fg = "#FFB600" },
                WhichKeyFloat = { bg = "#282828" },
                MiniStarterItemBullet = { fg = "#EFDAAD" },
                MiniStarterItemPrefix = { fg = "#B8BB00" },
                MiniStarterSection = { fg = "#FFB600" },
                TelescopePreviewBorder = { fg = "#282828" },
                TelescopeResultsBorder = { fg = "#282828" },
                TelescopePromptTitle = { fg = "#282828", bg = "#FFB600" },
                TelescopePromptNormal = { bg = "#958272", fg = "#282828" },
                TelescopePromptBorder = { bg = "#958272", fg = "#958272" },
                TelescopePromptCounter = { link = "TelescopePromptPrefix" },
                TelescopeTitle = { bg = "#FFB600" },
            },
            dim_inactive = false,
            transparent_mode = false,
        },
        -- init = function()
        -- vim.o.background = "dark" -- or 'light'
        -- vim.cmd.colorscheme "gruvbox"
        -- end,
    },
    {
        "oxfist/night-owl.nvim",
        lazy = true,
        -- init = function()
        -- vim.o.background = "dark" -- or 'light'
        -- vim.cmd.colorscheme "night-owl"
        -- end,
    },
}

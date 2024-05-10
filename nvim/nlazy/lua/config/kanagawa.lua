require('kanagawa').setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    theme = "dragon",
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none",
                   --  bg = "#000000",
                    -- TelescopeSelection = {  bg = "#F2ECBC" },
                }
            }
        }
    },
overrides = function(colors)
    local theme = colors.theme
    return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
    }
end
    --    overrides = function(colors) -- add/modify highlights
    --        return {
    --           TelescopeSelection = { fg = "#C4746E", bg = "#000000" },
    --           TelescopeSelectionCaret = { fg = "#C4746E", bg = "#000000" },
    --          TelescopePromptPrefix = { fg = "#C4746E", bg = "#000000" },
    --            TelescopePrompt = { bg = "#202028" },
    --        }
    --    end,
})
vim.cmd('colorscheme kangawa')

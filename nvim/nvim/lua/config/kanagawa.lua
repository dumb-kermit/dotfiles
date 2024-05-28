require("kanagawa").setup {
  compile = true,
  undercurl = false, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = { italic = true },
  keywordStyle = { italic = true },
  statementStyle = { italic = true },
  typeStyle = { italic = true },
  transparent = true, -- do not set background color
  dimInactive = false, -- dim inactive window `:h hl-NormalNC`
  theme = "wave",
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
          --bg = "#202028",
          TelescopeSelection = { fg = "#DA6700", bg = "#F4ECB6" },
          --bg = "#1E1F4B",
          -- TelescopeSelection = {  bg = "#F2ECBC" },
        },
      },
    },
  },
  overrides = function(colors)
    local theme = colors.theme
    return {
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
    }
  end,
}
vim.cmd "hi TelescopeSelection guibg=#F4ECB6 guifg=#DA6700"
vim.cmd "hi TelescopeSelectionCaret guibg=#F4ECB6 guifg=#DA6700"
vim.cmd "hi TelescopePromptPrefix guifg=#DA6700"
vim.cmd "hi TelescopeMatching guibg=none guifg=#EDC17A"

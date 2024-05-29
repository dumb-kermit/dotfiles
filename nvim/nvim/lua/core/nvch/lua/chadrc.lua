-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "oxocarbon",
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
  },
  telescope = { style = "borderless" },
  statusline = {
    theme = "minimal",
    separator_style = "round",
    -- order = { "mode", "file", "%=", "pos", "%=", "td", "mark" },
    modules = {
      mark = function()
        return string.format "%%#StatuslineSidemark#  ▊"
      end,
      ---@return string
      td = function()
        local time = os.date "%r"
        return string.format("%%#StatuslineTime# %s", time)
      end,
      ver = function()
        --local v = vim.version()
        --return "%#FAD700#" .. v.major .. v.minor .. v.patch
        return "vim.version()"
      end,
      pos = function()
        return "Ln %l, Col %c %s"
      end,
      doom = function()
        return "%#FAD700#" .. "  "
        --  return "%#@variable.member.lua#" .. "  "
      end,
    },
  },
  cheatsheet = {
    theme = "simple",
  },
  tabufline = {
    enabled = false,
    lazyload = true,
    order = { "buffers" },
  },
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  █  FIND FILES", "Spc f f", "Telescope find_files" },
      { "  █  RECENT FILES", "Spc f o", "Telescope oldfiles" },
      { "  █  PICK THEMES", "Spc t h", "Telescope themes" },
      { "  █  PICK KEYMAPS", "Spc c h", "NvCheatsheet" },
    },
  },
  lsp = { signature = false },
  hl_override = {
    --Normal = { bg = "#363636" },
    --Normal = { bg = "#252523" },
    ChangesSignTextAdd = { fg = "#B8BB00", bg = "none" },
    ChangesSignTextDel = { fg = "#FF6774", bg = "none" },
    ChangesSignTextCh = { fg = "#BAE980", bg = "none" },
    --TelescopeSelection = { link = "@boolean.lua" },
    --TelescopeSelectionCaret = { link = "@boolean.lua" },
    --TelescopeMatching = { link = "@boolean.lua" },
    -- TelescopeBorder = { link = "@variable.member.lua" },
    --TelescopePromptBorder = { link = "@function.lua" },

    --TelescopeResultsTitle = { link = "@boolean.lua" },
    --TelescopePreviewTitle = { link = "@boolean.lua" },
    --TelescopePromptTitle = { link = "@boolean.lua" },
    --TelescopeNormal = { bg = "#252523" },
    CursorLineNr = { link = "@boolean.lua" },
    LspReferenceRead = { bg = "none" },
    LspReferenceText = { bg = "none" },
    LspReferenceWrite = { bg = "none" },
    -- TelescopeSelection = { bg = "none", fg = "#00A9E5" },
    -- TelescopeSelectionCaret = { bg = "none", fg = "#00A9E5" },
    -- TelescopeMatching = { bg = "none", fg = "#00A9E5" },
    NvDashAscii = { link = "@variable.member.lua" },
    NvDashButtons = { link = "@variable.member.lua" },
    FoldColumn = { bg = "none" },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    String = { italic = true },
    ["@string"] = { italic = true },
    Operator = { italic = true },
    ["@operator"] = { italic = true },
  },
}

return M

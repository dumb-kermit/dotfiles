local config = require("nvconfig").ui.statusline
local sep_style = config.separator_style
local utils = require "nvchad.stl.utils"

local default_sep_icons = {
  default = { left = "", right = "" },
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}

local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

local sep_l = separators["left"]
local sep_r = separators["right"]

local M = {}

M.posy = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon# %#StText# Ln %l, Col %c "
M["%="] = "%="

return function()
  return utils.generate("default", M)
end

-- M.ui = {
-- statusline = {
-- order = { "mode", "file", "%=", "lsp", "cwd", "posy" }
-- }
-- }
-- return M

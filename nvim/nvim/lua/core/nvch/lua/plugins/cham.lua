-- Lua (chameleon.lua)
return {
  {
    "shaun-mathew/Chameleon.nvim",
    lazy = false,
    config = function()
      require("chameleon").setup()
    end,
  },
}

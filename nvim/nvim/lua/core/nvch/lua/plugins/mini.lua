return {
  {
    "echasnovski/mini.pairs",
    lazy = false,
    event = "InsertEnter",
    init = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.diff",
    lazy = false,
    init = function()
      require "configs.diff"
    end,
  },
  {
    "echasnovski/mini.indentscope",
    --enabled = false,
    event = "LspAttach",
    init = function()
      local MiniIndentscope = require "mini.indentscope"
      require("mini.indentscope").setup {
        draw = {
          animation = MiniIndentscope.gen_animation.quadratic {
            easing = "out",
            duration = 480,
            unit = "total",
          },
          delay = 0,
        },
        -- symbol = '･',
        symbol = "•",
        --symbol = '･',
        --symbol = "􁾬",
        --symbol = "𐫵",
        --symbol = '􀆈',
        --symbol = '􀓃',
        --symbol = '􀄩',
        --symbol = '•',
        --symbol = "╎",
        options = {
          indent_at_cursor = false,
          try_as_border = true,
        },
      }
    end,
  },
  {
    "echasnovski/mini.cursorword",
    lazy = true,
    event = "VeryLazy",
    init = function()
      require("mini.cursorword").setup()
    end,
  },
  {
    "echasnovski/mini.sessions",
    --enabled = false,
    lazy = false,
    priority = 1000,
    version = false,
  },
  {
    "echasnovski/mini.notify",
    event = "VeryLazy",
    lazy = false,
    init = function()
      require("mini.notify").setup()
      vim.notify = require("mini.notify").make_notify()
    end,
  },
}

return {
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    config = function()
      require('mini.pairs').setup()
    end,
  },
  {
    'echasnovski/mini.indentscope', lazy = false,
    event = 'VeryLazy',
    setup = function()
      require('mini.indentscope').setup({
        draw = {
          delay = 0.5,
        },
        symbol = '•',
        options = { try_as_border = false },
      })
    end,
  },
  {
    'echasnovski/mini.cursorword', lazy = false,
    event = 'VeryLazy',
    setup = function()
      require('mini.cursorword').setup()
    end,
  },
  {
    'echasnovski/mini.notify',
    event = 'VeryLazy',
    lazy = true,
    setup = function()
      require('mini.notify').setup()
    end,
  },
}
-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field

-- ... and there is more!
--  Check out: https://github.com/echasnovski/mini.nvim

-- vim: ts=2 sts=2 sw=2 et

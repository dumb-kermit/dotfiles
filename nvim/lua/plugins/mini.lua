return {
  {
    'echasnovski/mini.pairs', lazy = tre,
    event = 'InsertEnter',
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
    lazy = false,
    setup = function()
      require('mini.notify').setup()
    end,
  },
}

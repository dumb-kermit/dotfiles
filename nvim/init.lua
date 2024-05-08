require("vim.fs")
vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require("lazy_boot")
require("lazy_conf")
require("options")
require("keymaps")
require("config.style")
require("mini.notify").setup({
    window = {
        winblend = 0
    }
})
vim.notify = require('mini.notify').make_notify()
require("mini.cursorword").setup()
-- require('mini.indentscope').gen_animation.quadratic({ easing = 'out', duration = 1000, unit = 'total' })
--local gen_animation = require('miniindentscope.gen_animation')
local MiniIndentscope = require('mini.indentscope')
require("mini.indentscope").setup({
        draw = {
          animation = MiniIndentscope.gen_animation.quadratic({ easing = 'out', duration = 380, unit = 'total' }),
          delay = 0.5,
        },
        border = "bottom",
        symbol = '•',
     --   symbol = '・',
        indent_at_cursor = false, 
        options = { try_as_border = false },
})

vim.cmd("set termguicolors")
--vim.cmd 'colorscheme kanagawa'
--require 'config.kanagawa'
--vim.cmd 'colorscheme gruvbox-material'
-- vim.opt.smoothscroll = true
vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("let g:gruvbox_material_background = 'hard'")
vim.cmd("let g:gruvbox_material_foreground = 'mix'")
vim.cmd("let g:gruvbox_material_cursor = 'blue'")
vim.cmd("let g:gruvbox_material_statusline_style = 'mix'")

vim.cmd("let g:material_terminal_italics = 1")
vim.cmd("let g:material_theme_style = 'lighter'")
--require("bluloco").setup({
--  style = "light",
--  transparent = false,
 -- italics = true,
--  terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
--  guicursor   = true,
--})

vim.cmd("set background=dark")
vim.cmd("colorscheme melange")
vim.cmd 'hi MiniIndentscopeSymbol guifg=403A36'
vim.cmd 'hi MiniNotifyNormal guibg=#2A2522'

--vim.cmd 'colorscheme gruvbox-material'
-- require 'config.kanagawa'
--vim.cmd 'hi Normal guibg=#1b1c24'
--vim.cmd 'hi NormalFloat guibg=#1E1C31'
--vim.cmd 'hi TelescopePromptPrefix guifg=#1b1c24 guibg=#1b1c24'
--vim.cmd 'hi SignColumn guibg=#1b1c24'
--vim.cmd 'hi DiffAdd guibg=#1b1c24'
--vim.cmd 'hi DiffText guibg=#1b1c24'
--vim.cmd 'hi TelescopePromptPrefix guibg=#1E2531 guifg=#1E2531'
--vim.cmd 'hi TelescopeSelection guibg=#1E2531 guifg=#FF8564'
--vim.cmd("hi TelescopeSelectionCaret guifg=#FE8019 guibg=#000000")
--vim.cmd 'hi Statement guifg=#FF8564'

--vim.cmd("hi SignColumn guibg=#000000")
--vim.cmd("hi Normal guibg=#000000")
--vim.cmd("hi NormalFloat guibg=#000000")
--vim.cmd("hi Pmenu guifg=#b3b1ad guibg=#000000")
--vim.cmd("hi WhichKeyFloat guibg=#000000")
--vim.cmd("hi MiniNotifyNormal guibg=#000000")
--vim.cmd("hi WinSeparator guibg=#000000")
--vim.cmd("hi TelescopePromptPrefix guifg=#FE8019 guibg=#000000")

--vim.cmd 'hi MiniNotifyNormal guibg=#1E1C31'

vim.g.lightline = {
	colorscheme = "PaperColor_light",
}
--vim.cmd 'hi StatusLine guibg=#1E2531'
--vim.cmd 'hi StatusLineNC guibg=#1E2531'

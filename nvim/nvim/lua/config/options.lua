-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.autowrite = true -- Enable auto write
vim.opt.splitright = true
vim.opt.splitbelow = false
opt.cursorline = false
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = false
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.splitbelow = false -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

vim.opt.cmdheight = 0
vim.opt.tabstop = 4
vim.opt.timeoutlen = 100
vim.opt.ttimeoutlen = 50
vim.opt.inccommand = "split"
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.laststatus = 3
vim.g.sweetie = {
	integrations = {
		lazy = true,
		neorg = true,
		neogit = true,
		neomake = true,
		telescope = true,
	},
	cursor_color = true,
}
vim.opt.mousescroll = "ver:1,hor:0"
vim.g.virtualtextcolor = true
vim.opt.fillchars = { eob = " " }

vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("let g:gruvbox_material_background = 'medium'")
vim.cmd("let g:gruvbox_material_cursor = 'blue'")
vim.cmd("set number")
vim.cmd("set norelativenumber")
vim.cmd("set showtabline=1")

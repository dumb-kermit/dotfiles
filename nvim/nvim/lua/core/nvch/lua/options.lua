require "nvchad.options"

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
--vim.opt.relativenumber = true
vim.o.cursorlineopt = "both"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "no"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 30

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "nosplit"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 0

-- Additional Stuff merged by Me
vim.opt.autowrite = true -- Enable auto write
vim.opt.laststatus = 3 -- global statusline
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.shiftround = true -- Round indent
vim.opt.shortmess:append { W = true, I = true, c = true, C = true }
vim.opt.splitkeep = "screen"
vim.opt.termguicolors = true
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = false -- Disable line wrap
vim.opt.cmdheight = 0
vim.opt.tabstop = 8
vim.opt.ttimeoutlen = 30
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mousescroll = "ver:1,hor:0"
vim.g.virtualtextcolor = true
vim.opt.fillchars:append { eob = " " }
vim.opt.showtabline = 1
--vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 1
--vim.cmd "set guicursor=a:hor2"
-- vim.cmd "set guicursor=a:ver6"
vim.cmd "set guicursor=a:block"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.cmd "set syntax=on"

if vim.fn.has "nvim-0.10" == 1 then
  vim.opt.smoothscroll = true
end

if vim.g.neovide then
  require "config.gui"
end

require "configs.cmds"

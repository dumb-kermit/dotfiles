--require "nvchad.mappings"

local map = vim.keymap.set

vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
--map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
--map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
--map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
--map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<leader>t", "<cmd>Telescope themes<CR>", { desc = "TSCP NVCH THEMES" })
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("n", "<D-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<D-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<D-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<D-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--movement--
map("n", "<S-a>", "0", { desc = "JUMP > 3W LEFT" })
map("n", "<S-d>", "$", { desc = "JUMP < 3W RIGHT" })
map("n", "<S-w>", "{", { desc = "JUMP 3L UP" })
map("n", "<S-s>", "}", { desc = "JUMP 3L DOWN" })
map("n", "w", "k", { noremap = true, desc = "JUMP 3L UP" })
map("n", "s", "j", { noremap = true, desc = "JUMP 3L DOWN" })
map("n", "a", "b", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "d", "w", { noremap = true, desc = "JUMP < 3W RIGHT" })
map("n", "r", "dw", { desc = "DELETE" })
map({ "n", "x", "o" }, "<S-enter>", "<Plug>(leap)", { desc = "LEAP OUT" })
-- map("n", "<CR>", "<Plug>(leap)", { desc = "TOGGLE LEAP" })
map("n", "<leader>1", ":bnext<CR>", { desc = "BUFF NEXT" })
map("n", "<leader>2", ":bprev<CR>", { desc = "BUFF PREV" })
map("n", "<D-a>", "<C-w>x", { desc = "TOGGLE PANE" })
map("n", "<leader>3", ":bd<CR>", { desc = "BUFF EXIT" })
map("n", "<S-f>", "<Plug>(leap)", { desc = "LEAPPINGOUTTAWINDOW" })
--menu--
map("n", "<leader>d", "<cmd>Nvdash<CR>", { desc = "TOGGLE DASH" })
--map("n", "<leader>5", "<cmd>lua MiniSessions.select()<CR>", { desc = "SESSION SELECT" })
map("n", "<leader>j", "<cmd>lua MiniNotify.show_history()<CR>", { desc = "TOGGLE HISTORY" })
map("n", "<S-p>", "<cmd>Lazy profile<CR>", { desc = "TOGGLE PROFILER" })
map("n", "<leader>4", "<cmd>Lazy<CR>", { desc = "TOGGLE LAZY" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "TOGGLE QUIT" })
--map("n", "<leader>4", "<cmd>lua MiniSessions.write('ss00')<CR>", { desc = "SESSION SAVE" })
--map("n", '`', "<cmd>lua require('which-key').show('`', {mode = 'n', auto = true})<CR>", { desc = "TOGGLE MARKS" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

--telescope--
map("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "SCOPE HELP" })
map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "SCOPE KEYMAPS" })
--map("n", "<leader>", "<cmd>Telescope oldfiles<CR>", { desc = "SCOPE RECENT" })
map("n", "<leader>?", "<cmd>Telescope commands<CR>", { desc = "TSCP COMMANDS" })
map("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "SCOPE BUFFERS" })
map("n", "<leader>z", function()
  local builtin = require "telescope.builtin"
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_cursor {
    winblend = 10,
    previewer = true,
  })
end, { desc = "SCOPE FUZZY" })
map("n", "<leader>/", function()
  local builtin = require "telescope.builtin"
  builtin.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "SCOPE CONFIG" })
map(
  "n",
  "<leader>b",
  "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true, desc = "TSCP BROWSE FILES" }
)
--clip--
map("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
map("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
map("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
map("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

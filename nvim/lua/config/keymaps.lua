-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set
--movement--
map("n", "<S-a>", "0", { desc = "JUMP > 3W LEFT" })
map("n", "<S-d>", "$", { desc = "JUMP < 3W RIGHT" })
map("n", "<S-w>", "{", { desc = "JUMP 3L UP" })
map("n", "<S-s>", "}", { desc = "JUMP 3L DOWN" })
map("n", "w", "3k", { noremap = true, desc = "JUMP 3L UP" })
map("n", "s", "3j", { noremap = true, desc = "JUMP 3L DOWN" })
map("n", "a", "b", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "d", "w", { noremap = true, desc = "JUMP < 3W RIGHT" })
map("n", "r", "dw", { desc = "DELETE" })
map("n", "<enter>", "<Plug>(leap)", { desc = "TOGGLE LEAP" })
map("n", "<C-d>", ":bnext<CR>", { desc = "BUFF NEXT" })
map("n", "<C-a>", ":bprev<CR>", { desc = "BUFF PREV" })
map("n", "<D-a>", "<C-w>x", { desc = "TOGGLE PANE" })
map("n", "<leader>c", ":bd<CR>", { desc = "BUFF EXIT"})

--menu--
--map("n", "<leader>d", "<cmd>lua MiniStarter.open()<CR>", { desc = "TOGGLE DASH" })
map("n", "<leader>d", "<cmd>lua MiniSessions.select()<CR>", { desc = "SESSION SELECT" })
map("n", "<leader>j", "<cmd>lua MiniNotify.show_history()<CR>", { desc = "TOGGLE HISTORY" })
map("n", "<S-p>", "<cmd>Lazy profile<CR>", { desc = "TOGGLE PROFILER" })
map('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'TOGGLE LAZY' })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "TOGGLE QUIT" })
map("n", "<leader>p", "<cmd>lua MiniSessions.write('ss00')<CR>", { desc = "SESSION SAVE" })
--map("n", '`', "<cmd>lua require('which-key').show('`', {mode = 'n', auto = true})<CR>", { desc = "TOGGLE MARKS" })

--telescope--
map("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "SCOPE HELP" })
map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "SCOPE KEYMAPS" })
--map("n", "<leader>", "<cmd>Telescope oldfiles<CR>", { desc = "SCOPE RECENT" })
map("n", "<leader>?", "<cmd>Telescope commands<CR>", { desc = "TSCP COMMANDS" })
map("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "SCOPE BUFFERS" })
map("n", "<leader>z", function()
	local builtin = require("telescope.builtin")
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_cursor({
		winblend = 10,
		previewer = true,
	}))
end, { desc = "SCOPE FUZZY" })
map("n", "<leader>/", function()
	local builtin = require("telescope.builtin")
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
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

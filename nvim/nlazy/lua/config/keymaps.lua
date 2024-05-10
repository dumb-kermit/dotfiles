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
map("n", "<D-d>", ":bnext<CR>", { desc = "NEXT BUFF" })
map("n", "<D-a>", ":bprev<CR>", { desc = "PREV BUFF" })

--menu--
map("n", "<leader>G", "<cmd>lua MiniStarter.open()<CR>", { desc = "TOGGLE DASH" })
map("n", "<S-l>", "<cmd>Lazy profile<CR>", { desc = "TOGGLE LAZY" })
--map('n', '<M-C-S-D-l>', '<cmd>Lazy<CR>', { desc = 'TOGGLE LAZY' })
map("n", "<S-q>", "<cmd>q<CR>", { desc = "TOGGLE QUIT" })

--telescope--
map("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "SCOPE HELP" })
map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "SCOPE KEYMAPS" })
map("n", "<leader>Tab", "<cmd>Telescope oldfiles<CR>", { desc = "SCOPE RECENT" })
map("n", "<leader>?", "<cmd>Telescope commands", { desc = "SCOPE COMMANDS" })
map("n", "<leader>T", "<cmd>Telescope colorscheme<CR>", { desc = "COLORSCOPE" })
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
	{ noremap = true, desc = "SCOPE FILES" }
)

--folding--
map("n", "<S-e>", "zi", { desc = "TOGGLE FOLD" })

--clip--
map("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
map("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
map("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
map("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

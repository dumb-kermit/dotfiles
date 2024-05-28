local map = vim.keymap.set

vim.opt.hlsearch = true
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>em", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Telescope Pretty Pickers --
--map("n", "<leader>tab", function()
-- require("config.telescope").prettyFilesPicker { picker = "oldfiles" }
-- end, { desc = "Pick Recent Buffers" })
-- map("n", "<leader>f", function()
-- require("config.telescope").prettyFilesPicker { picker = "find_files" }
-- end, { desc = "Pick All Files" })
--map("n", "<leader>tp", function()
--  require("telescopePickers").prettyGrepPicker { picker = "grep_string" }
--end, { desc = "Pick GREP String" })
--map("n", "<leader>fb", function()
-- require("telescopePickers").prettyFilesPicker() end, opts = cwd = vim.fn.stdpath)
--map('n', '<leader>fs', function() pickers.prettyDocumentSymbols() end, opts)
--map('n', '<leader>ws', function() pickers.prettyWorkspaceSymbols() end, opts)
--map("n", "<leader>t/", function()
--  pickers.prettyFilesPicker()
--end, { cwd = vim.fn.stdpath "config" })

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

--movement--
map("n", "<S-a>", "0", { desc = "JUMP > 3W LEFT" })
map("n", "<S-d>", "$", { desc = "JUMP < 3W RIGHT" })
map("n", "<S-w>", "{", { desc = "JUMP 3L UP" })
map("n", "<S-s>", "}", { desc = "JUMP 3L DOWN" })

map("n", "w", "k", { noremap = true, desc = "JUMP 3L UP" })
map("n", "s", "j", { noremap = true, desc = "JUMP 3L DOWN" })
--map("n", "a", "b", { noremap = true, desc = "JUMP > 3W LEFT" })
--map("n", "d", "w", { noremap = true, desc = "JUMP < 3W RIGHT" })

map("n", "a", "h", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "d", "l", { noremap = true, desc = "JUMP < 3W RIGHT" })

map("n", "<D-a>", "b", { noremap = true, desc = "JUMP > 3W LEFT" })
map("n", "<D-d>", "w", { noremap = true, desc = "JUMP < 3W RIGHT" })

--map("n", "w", "3k", { noremap = true, desc = "JUMP 3L UP" })
--map("n", "s", "3j", { noremap = true, desc = "JUMP 3L DOWN" })
--map("n", "a", "b", { noremap = true, desc = "JUMP > 3W LEFT" })
--map("n", "d", "w", { noremap = true, desc = "JUMP < 3W RIGHT" })

map("n", "r", "dw", { desc = "DELETE" })
map({ "n", "x", "o" }, "<enter>", "<Plug>(leap)", { desc = "LEAP OUT" })
map("n", "<leader>1", ":bnext<CR>", { desc = "BUFFR $NEXT" })
map("n", "<leader>2", ":bprev<CR>", { desc = "BUFFR $PREV" })
--map("n", "<D-a>", "<C-w>x", { desc = "BRING $PANES" })
map("n", "<leader>3", ":bd<CR>", { desc = "BUFFR $EXIT" })

--menu--
map("n", "<leader>d", "<cmd>lua MiniStarter.open()<CR>", { desc = "BRING $DASH" })
--map("n", "<leader>5", "<cmd>lua MiniSessions.select()<CR>", { desc = "SESSION SELECT" })
map("n", "<leader>j", "<cmd>lua MiniNotify.show_history()<CR>", { desc = "BRING $HISTORY" })
map("n", "<S-p>", "<cmd>Lazy profile<CR>", { desc = "BRING $PROFILER" })
map("n", "<leader>4", "<cmd>Lazy<CR>", { desc = "BRING $LAZY" })
map("n", "<leader>0", "<cmd>Themer<CR>", { desc = "SCOPE $COLOURS" })
--map("n", "<leader>Q", "<cmd>quitall!<CR>", { desc = "TOGGLE QUIT" })
--map("n", "<leader>6", "<cmd>lua MiniSessions.write('ss00')<CR>", { desc = "SESSION SAVE" })

--telescope--
map("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "SCOPE HELP" })
map("n", "<leader>k", "<cmd>Telescope keymaps<CR>", { desc = "SCOPE KEYMAPS" })
--map("n", "<leader>", "<cmd>Telescope oldfiles<CR>", { desc = "SCOPE RECENT" })
map("n", "<leader>?", "<cmd>Telescope commands<CR>", { desc = "SCOPE $OPTS" })
--map("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "SCOPE BUFFERS" })
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

local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
vim.api.nvim_set_hl(0, "LeapMatch", {
    -- For light themes, set to 'black' or similar.
    fg = "white",
    bold = true,
    nocombine = true,
})

-- Lightspeed colors
-- primary labels: bg = "#f02077" (light theme) or "#ff2f87"  (dark theme)
-- secondary labels: bg = "#399d9f" (light theme) or "#99ddff" (dark theme)
-- shortcuts: bg = "#f00077", fg = "white"
-- You might want to use either the primary label or the shortcut colors
-- for Leap primary labels, depending on your taste.
vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
    fg = "red",
    bold = true,
    nocombine = true,
})
vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
    fg = "blue",
    bold = true,
    nocombine = true,
})

autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("User", {
    pattern = "LeapEnter",
    callback = function()
        vim.cmd.hi("Cursor", "blend=100")
        vim.opt.guicursor:append { "a:Cursor/lCursor" }
    end,
})

autocmd("User", {
    pattern = "LeapLeave",
    callback = function()
        vim.cmd.hi("Cursor", "blend=0")
        vim.opt.guicursor:remove { "a:Cursor/lCursor" }
    end,
})

-- booting LSP for lua in time
-- local group = vim.api.nvim_create_augroup("lsp-tricks", { clear = true })
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- pattern = { "*.lua" },
-- callback = function(ev)
-- vim.cmd "LspStart lua"
-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
-- vim.api.nvim_set_hl(0, group, {})
-- end
-- end,
-- group = group,
-- })
-- logic to start lsp server, be sure to not start multiple instances
-- at once, check neovim api
-- possible command to start server vim.cmd([[ :LspStart bashls ]])
--	end,
--	group = group,
--})

autocmd("FileType", {
    pattern = {
        "mini.starter",
        "alpha",
        "dashboard",
        "neo-tree",
        "telescope",
        "lazy",
        "mason",
        "txt",
    },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

--autocmd('VimEnter', {
--  pattern = { '*' },
--  callback = function()
--    require('mini.pairs').setup()
--    require('mini.cursorword').setup()
--  end,
--  group = group,
--})

autocmd("InsertEnter", {
    pattern = { "*.py" },
    callback = function(ev)
        vim.cmd "LspStart python-lsp-server"
        -- logic to start lsp server, be sure to not start multiple instances
        -- at once, check neovim api
        -- possible command to start server vim.cmd([[ :LspStart bashls ]])
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd "tabdo wincmd ="
        vim.cmd("tabnext " .. current_tab)
    end,
})

autocmd({ "ModeChanged" }, {
    callback = function()
        LspReferenceText = { bg = "none", italic = true }
        LspReferenceWrite = { bg = "none", italic = true }
        LspReferenceRead = { bg = "none", italic = true }
    end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format { async = true, lsp_fallback = true, range = range }
end, { range = true })

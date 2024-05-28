-- require "vim.fs"
-- vim.loader.enable()
vim.o.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

require "options"

require "keymaps"

require "lazy-bootstrap"

require "lazy-plugins"

require "config.statusline"

-- require "config.jj"

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- pattern = "*",
-- callback = function()
-- package.loaded["feline"] = nil
-- package.loaded["catppuccin.groups.integrations.feline"] = nil
-- require("feline").setup {
-- components = require("catppuccin.groups.integrations.feline").get(),
-- }
-- end,
-- })

-- vim.api.nvim_create_autocmd("LspAttach", {
-- callback = function(args)
-- local client = vim.lsp.get_client_by_id(args.data.client_id)
-- client.server_capabilities.semanticTokensProvider = nil
-- end,
-- });

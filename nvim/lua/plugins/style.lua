return {
	{ "fenetikm/falcon", lazy = true },
	{
		"Shatur/neovim-ayu",
		lazy = true,
		setup = function()
			local colors = require("ayu.colors")
			colors.generate() -- Pass `true` to enable mirage
			require("ayu").setup({
				overrides = function()
					return { Comment = { fg = colors.comment } }
				end,
			})
		end,
	},
    { "kaicataldo/material.vim", lazy = true },
    { "arturgoms/moonbow.nvim", lazy = true },
    { "embark-theme/vim", lazy = true, name = "embark" },
	{
		"sainnhe/gruvbox-material",
		lazy = true,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			require("config.kanagawa")
		end,
	},
    { "NLKNguyen/papercolor-theme", lazy = true },
    { "https://gitlab.com/protesilaos/tempus-themes-vim.git", lazy = true },
    { "drewtempelmeyer/palenight.vim", lazy = true },
    {
        'uloco/bluloco.nvim',
        lazy = true,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
        require("bluloco").setup({
        style = "auto",               -- "auto" | "dark" | "light"
        transparent = false,
        italics = false,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor   = true,  -- your optional config goes here, see below.
        })
        end
},
{ "pineapplegiant/spaceduck", lazy = true },
{ "savq/melange-nvim", lazy = true },
{ "cocopon/iceberg.vim", lazy = true },
{ "rakr/vim-one", lazy = true, name = "vim-one" },
{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		setup = function()
			vim.g.lightline = { colorscheme = "moonfly" }
			vim.g.moonflyCursorColor = true
			vim.g.moonflyItalics = false
			vim.g.moonflyNormalFloat = true
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
			})
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
				border = "single",
			})
			vim.diagnostic.config({ float = { border = "single" } })
			local winhighlight = {
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
			}
			require("cmp").setup({
				window = {
					completion = cmp.config.window.bordered(winhighlight),
					documentation = cmp.config.window.bordered(winhighlight),
				},
			})
			vim.g.moonflyTerminalColors = true
			vim.g.moonflyUnderlineMatchParen = true
			vim.g.moonflyVirtualTextColor = true
			vim.g.moonflyWinSeparator = 2
			vim.opt.fillchars = {
				horiz = "━",
				horizup = "┻",
				horizdown = "┳",
				vert = "┃",
				vertleft = "┫",
				vertright = "┣",
				verthoriz = "╋",
			}
		end,
	},
{
  "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true
}
}

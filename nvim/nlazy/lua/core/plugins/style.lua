return {
	{ "fenetikm/falcon", lazy = true, cmd = "LCS Extra" },
	{
		"Shatur/neovim-ayu",
		lazy = false,
		cmd = "LCS Extra",
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
	{
		"sainnhe/gruvbox-material",
		lazy = true,
		cmd = "LCS Extra",
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		cmd = "LCS Extra",
		config = function()
			require("config.kanagawa")
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		cmd = "LCS Extra",
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
}

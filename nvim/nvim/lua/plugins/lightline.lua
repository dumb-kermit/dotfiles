return {
	{
		"itchyny/lightline.vim",
		enabled = false,
        event = "VeryLazy",
		setup = function()
			require("lightline").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
       -- enabled = false,
        event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
                    theme = "moonbow",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_c = { "filename", "diff", "diagnostics" },
					lualine_b = {
						{
							"buffers",
							showfilenameonly = true, -- Shows shortened relative path when set to false.
							hidefilenameextension = false, -- Hide filename extension when set to true.
							showmodifiedstatus = true, -- Shows indicator when the buffer is modified.

							mode = 1, -- 0: Shows buffer name
							-- 1: Shows buffer index
							-- 2: Shows buffer name + buffer index
							-- 3: Shows buffer number
							-- 4: Shows buffer name + buffer number

							max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
							-- it can also be a function that returns
							-- the value of max_length dynamically.
							filetype_names = {
								TelescopePrompt = "TELESCOPE",
								dashboard = "DASHBOARD",
								packer = "PCKR",
								fzf = "FZF",
								alpha = "A-PVP",
								lazy = "LAZYzzz",
								Starter = "NEO-STARTER",
							}, -- Shows specific buffer name for that filetype ( { filetype = buffer_name, ... } )

							-- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
							usemodecolors = true,
							symbols = {
								modified = "+", -- Text to show when the buffer is modified
								alternate_file = " ", -- Text to show to identify the alternate file
								directory = " ", -- Text to show when the buffer is a directory
							},
						},
					},
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
		--    dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
}

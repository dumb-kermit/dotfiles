
require("lazy").stats({
	-- startuptime in milliseconds till UIEnter
	startuptime = 0,
	-- when true, startuptime is the accurate cputime for the Neovim process. (Linux & Macos)
	-- this is more accurate than `nvim --startuptime`, and as such will be slightly higher
	-- when false, startuptime is calculated based on a delta with a timestamp when lazy started.
	real_cputime = true,
	count = 0, -- total number of plugins
	loaded = 0, -- number of loaded plugins
	---@type table<string, number>
	times = {},
})
require("lazy").setup({
	import = "plugins",
}, {
	defaults = {
		lazy = true,
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = 1,
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
		check_pinned = false, -- check for pinned packages that can't be updated
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
        "matchparen",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
		profiling = {
			-- Enables extra stats on the debug tab related to the loader cache.
			-- Additionally gathers stats about all package.loaders
			loader = false,
			-- Track each new require in the Lazy profiling tab
			require = false,
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et

return {
	{
		"echasnovski/mini.starter",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		lazy = false,
       --  event = "VeryLazy",
		--  event = "VimEnter",
		opts = function()
			local logo = table.concat({
				"            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
				"            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
				"            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
				"            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
				"            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
				"            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
			}, "\n")
			local pad = string.rep(" ", 22)
			local new_section = function(name, action, section)
				return { name = name, action = action, section = pad .. section }
			end

			local hola = "WELCOME BACK, MY FORTUNATE SON."

			local starter = require("mini.starter")
			local tab = table.concat({
				"                                                                                                                           ",
				"   &&     && &&&&&&&&& &&    &&&&&&&&&&&&           &&&&&&&&& &&&&&&&&& &&&&&&&&& &&&&&&&&&&&&&&&&&& &&&&&&&&& &&&&&&&&&   ",
				"   &&&& &&&&    &&&    &&&&  &&&    &&              &&           &&&          &&& &&    &&&    &&    &&&       &&     &&   ",
				"   && &&& &&    &&&    && && &&&    &&              &&&&&&&&&    &&&    &&&&&&&&& &&&&&&&&&    &&    &&&&&&&&& &&&&&&&&&   ",
				"   &&     &&    &&&    &&  &&&&&    &&                     &&    &&&    &&    &&& &&  &&&      &&    &&&       &&   &&     ",
				"   &&     && &&&&&&&&& &&    &&&&&&&&&&&&     &&    &&&&&&&&&    &&&    &&&&&&&&& &&    &&&    &&    &&&&&&&&& &&     &&   ",
				"                                                                                                                           ",
			}, "\n")
			local config = {
				evaluate_single = true,
				header = hola,
				-- header = tab,
				items = {
					starter.sections.recent_files(5, false),
				--	new_section("BACKGROUND LIGHT", "set background=light", "BACKGROUND"),
				--	new_section("BACKGROUND DARK", "set background=dark", "BACKGROUND"),
				--	new_section("LOAD SCHEMES", "LCS Extra", "COLORSCOPE"),
					new_section("PICK COLORS", "Telescope colorscheme", "COLORSCHEMES"),
				--	new_section("SWEETIE", "colorscheme sweetie", "TRUE COLORS"),
					new_section("GRUVBOX MATERIAL", "colorscheme gruvbox-material", "TRUE COLORS"),
                    new_section("EMBARK", "colorscheme embark", "TRUE COLORS"),
                    new_section("PALENIGHT", "colorscheme palenight", "TRUE COLORS"),
                    new_section("AYU DARK", "colorscheme ayu-dark", "TRUE COLORS"),
                    new_section("AYU MIRAGE", "colorscheme ayu-mirage", "TRUE COLORS"),
                    new_section("FALCON", "colorscheme falcon", "TRUE COLORS"),
                    new_section("MOONBOW", "colorscheme moonbow", "TRUE COLORS"),
					new_section("KANAGAWA WAVE", "colorscheme kanagawa", "TRUE COLORS"),
					new_section("KANAGAWA DRAGON", "colorscheme kanagawa-dragon", "TRUE COLORS"),
				--	new_section("DOOM-ONE", "colorscheme doom-one", "TRUE COLORS"),
					new_section("TOGGLE LAZY", "Lazy", "NEOVIM"),
					new_section("TOGGLE QUIT", "quit!", "NEOVIM"),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.indexing("all", { "Builtin actions" }),
					starter.gen_hook.padding(3, 2),
					starter.gen_hook.aligning("left", "center"),
				},
			}
			return config
		end,
		config = function(_, config)
			-- close Lazy and re-open when starter is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "MiniStarterOpened",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			local starter = require("mini.starter")
			starter.setup(config)

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					local pad_footer = string.rep(" ", 8)
					starter.config.footer = pad_footer
						.. "􀋦 NVIM STARTED WITH "
						.. stats.count
						.. " PLUGINS IN "
						.. ms
						.. "MS"
					local stat = pad_footer .. "􀋦 NVIM STARTED WITH " .. stats.count .. " PLUGINS IN " .. ms .. "MS"
					pcall(starter.refresh)
				end,
			})
		end,
	},
}

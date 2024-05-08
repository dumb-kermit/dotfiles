local harpoon = require("harpoon")
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader><enter>", function()
	toggle_telescope(harpoon:list())
end, { desc = "HARPOON LIST" })
vim.keymap.set("n", "<leader>=", function()
	harpoon:list():add()
end, { desc = "HARPOON MARK" })
vim.keymap.set("n", "<C-Left>", function()
	harpoon:list():prev()
end, { desc = "HARPOON PREV" })
vim.keymap.set("n", "<C-Right>", function()
	harpoon:list():next()
end, { desc = "HARPOON NEXT" })

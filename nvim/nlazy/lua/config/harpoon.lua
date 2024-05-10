local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<S-f>", function() toggle_telescope(harpoon:list()) end, { desc = "POON LIST" })
vim.keymap.set("n", "<S-e>", function() harpoon:list():add() end, { desc = "POON MARK" })
vim.keymap.set("n", "<S-Left>", function() harpoon:list():prev() end, { desc = "POON PREV" })
vim.keymap.set("n", "<S-Right>", function() harpoon:list():next() end, { desc = "POON NEXT" })


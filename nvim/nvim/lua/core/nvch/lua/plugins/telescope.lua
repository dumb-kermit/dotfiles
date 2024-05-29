-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    keys = {
      {
        "<leader>b",
        "<cmd>Telescope file_browser theme=ivy grouped=true hide_parent_dir=true prompt_path=true path=%:p:h select_buffer=true<CR>",
        desc = "TSCP BROWSE FILES",
      },
    },
    config = function()
      require("telescope").setup {
        extensions = {
          file_browser = {
            theme = "ivy",
            grouped = true,
            files = true,
            add_dirs = true,
            depth = 2,
            auto_depth = true,
            browse_files = require("telescope._extensions.file_browser.finders").browse_files,
            browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
            hide_parent_dir = true,
            collapse_dirs = false,
            prompt_path = false,
            hidden = { file_browser = true, folder_browser = true },
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
          },
        },
      }
    end,
  },
  { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    lazy = true,
    keys = { { "<leader>" } },
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "debugloop/telescope-undo.nvim" },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { "nvim-tree/nvim-web-devicons" },
      {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
          ---@diagnostic disable-next-line: duplicate-set-field
          vim.ui.select = function(...)
            require("lazy").load { plugins = { "dressing.nvim" } }
            return vim.ui.select(...)
          end
          ---@diagnostic disable-next-line: duplicate-set-field
          vim.ui.input = function(...)
            require("lazy").load { plugins = { "dressing.nvim" } }
            return vim.ui.input(...)
          end
        end,
      },
      -- {
      -- "stevearc/dressing.nvim",
      --enabled = false,
      -- lazy = false,
      -- opts = {},
      -- },
    },
    config = function()
      dofile(vim.g.base46_cache .. "telescope")
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup {
        extensions = {
          file_browser = {
            hidden = { file_browser = true, folder_browser = true },
          },
        },
        defaults = {
          preview = {
            mime_hook = function(filepath, bufnr, opts)
              local is_image = function(filepath)
                local image_extensions = { "png", "jpg" } -- Supported image formats
                local split_path = vim.split(filepath:lower(), ".", { plain = true })
                local extension = split_path[#split_path]
                return vim.tbl_contains(image_extensions, extension)
              end
              if is_image(filepath) then
                local term = vim.api.nvim_open_term(bufnr, {})
                local function send_output(_, data, _)
                  for _, d in ipairs(data) do
                    vim.api.nvim_chan_send(term, d .. "\r\n")
                  end
                end
                vim.fn.jobstart({
                  "catimg",
                  filepath, -- Terminal image viewer command
                }, { on_stdout = send_output, stdout_buffered = true, pty = true })
              else
                require("telescope.previewers.utils").set_preview_message(
                  bufnr,
                  opts.winid,
                  "Binary cannot be previewed"
                )
              end
            end,
          },
          border = true,
          --borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          --borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
          sorting_strategy = "descending",
          selection_strategy = "reset",
          prompt_position = "top",
          prompt_prefix = " ",
          selection_caret = " ",
          entry_prefix = " ",
          --prompt_prefix = "􀊫  ",
          --selection_caret = ' ',
          --entry_prefix = ' ',
          --prompt_prefix = " • ",
          --selection_caret = " • ",
          --entry_prefix = " • ",
          --entry_prefix = "   ",
          --entry_prefix = " ・ ",
          path_display = { "smart" },
          color_devicons = true,
          --layout_strategy = "horizontal",
          --layout_config = {
          --horizontal = {
          --width = 1.0,
          --height = 1.0,
          --	},
          --	width = 100.0,
          --height = 100.0,
          --layout_strategy = 'horizontal',
          --layout_config = {
          --flex = {
          --height = 0.6,
          --},
          --horizontal = {
          -- height = 0.70,
          --width = 0.88,
          --},
          --height = function(_, cols, _)
          -- if cols > 200 then
          --  return 170
          --else
          --  return math.floor(cols * 0.87)
          --end
          --end,
          -- preview_cutoff = 90,
          -- width = 120.0,
          --},
          --},
          -- You can put your default mappings / updates / etc. in here
          --  All the info you're looking for is in `:help telescope.setup()`
          --
          -- defaults = {
          --   mappings = {
          --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          --   },
        },
        -- pickers = {}
        pickers = {
          help_tags = {
            mappings = {
              i = {
                ["<CR>"] = "file_vsplit",
              },
            },
            colorscheme = {
              enable_preview = true,
            },
          },
          extensions = {
            fzf = {
              fuzzy = true, -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true, -- override the file sorter
              case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
            undo = {
              use_delta = true,
              use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
              side_by_side = false,
              diff_context_lines = vim.o.scrolloff,
              entry_format = "state #$ID, $STAT, $TIME",
              time_format = "",
              saved_only = false,
            },
            -- file_browser = {
            -- theme = "ivy",
            -- grouped = true,
            -- hidden = { file_browser = true, folder_browser = true },
            -- display_stat = { date = false, size = true, mode = false },
            -- },
            ["ui-select"] = {
              require("telescope.themes").get_dropdown(),
            },
          },
        },
      }
      -- Enable Telescope extensions if they are installed
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "ui-select"
      require("telescope").load_extension "undo"
      require("telescope").load_extension "file_browser"

      -- See `:help telescope.builtin`
      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "TSCP HELP" })
      -- vim.keymap.set("n", "<leader>t", builtin.colorscheme, { desc = "TSCP COLORS" })
      vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "TSCP KEYMAPS" })
      vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "TSCP FIND FILES" })
      vim.keymap.set("n", "<leader>s", "<cmd>Telescope<CR>", { desc = "TSCP SELECTOR" })
      vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "TSCP ACTIVE WORD" })
      vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "TSCP GREP FILES" })
      vim.keymap.set("n", "<leader>a", builtin.diagnostics, { desc = "TSCP DIAGNOSTICS" })
      vim.keymap.set("n", "<leader>c", builtin.marks, { desc = "TSCP MARKS" })
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "TSCP UNDO" })
      --	vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "TSCP SESSIONS" })

      vim.keymap.set("n", "<tab>", builtin.oldfiles, { desc = "TSCP RECENT FILES" })

      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "TSCP ACTIVE BUFFERS" })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>z", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find {
          winblend = 10,
        }
      end, { desc = "TSCP FUZZY BUFFERS" })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>y", function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end, { desc = "TSCP GREP BUFFERS" })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>/", function()
        builtin.find_files { cwd = vim.fn.stdpath "config" }
      end, { desc = "TSCP CONFIG FILES" })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

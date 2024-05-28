return {
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = true,
    event = 'InsertEnter',
  },
  {
    'code-biscuits/nvim-biscuits',
    lazy = true,
    event = 'InsertEnter',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    run = ':TSUpdate',
    config = function()
      require('nvim-biscuits').setup {
        cursor_line_only = true,
        show_on_start = true,
        --    toggle_keybind = "<leader>B"
      }
    end,
  },
}

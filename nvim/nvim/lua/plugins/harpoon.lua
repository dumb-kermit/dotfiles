return {
  {
    "ThePrimeagen/harpoon",
    keys = { { "<leader>" } },
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "config.harpoon"
    end,
  },
}

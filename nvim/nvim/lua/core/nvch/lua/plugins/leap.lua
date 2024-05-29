return {
  {
    "ggandor/leap.nvim",
    lazy = true,
    event = "InsertEnter",
    keys = { { "<leader>" } },
    dependencies = { "tpope/vim-repeat" },
  },
}

return {
  {
    "ggandor/leap.nvim",
    lazy = true,
    event = "InsertEnter",
    keys = { { "<leader>" } },
    dependencies = { "tpope/vim-repeat" },
    setup = function()
      require("leap").opts.highlight_unlabeled_phase_one_targets = true
    end,
  },
}

return {
    {
        "ggandor/leap.nvim",
        lazy = true,
        -- event = "InsertEnter",
        keys = { { "<leader>" }, { "<CR>" }, desc = "TOGGLE LEAP" },
        dependencies = { "tpope/vim-repeat" },
        config = function()
        vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
        vim.api.nvim_set_hl(0, 'LeapMatch', {
        fg = 'white', bold = true, nocombine = true,
        })
        vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
        fg = 'red', bold = true, nocombine = true,
        })
        vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
        fg = 'blue', bold = true, nocombine = true,
        })
        require('leap').opts.highlight_unlabeled_phase_one_targets = true
        end
    }
}

return {
    {
        "ggandor/leap.nvim",
        lazy = true,
        event = "InsertEnter",
        keys = { { "<enter>" } },
        dependencies = { "tpope/vim-repeat" },
        --     init = function()
        --       require('leap').setup()
        --     vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#777777', bg = '' })
        --  end
        -- Or just set to grey directly, e.g. { fg = '#777777' },
        -- -- if Comment is saturated.
        --	config = function()
        --    require('leap').setup()
        --	require('leap').opts.highlight_unlabeled_phase_one_targets = true
        -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
        -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' }) -- or some grey
        -- vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true })
        -- vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = 'red', bold = true, nocombine = true })
        -- vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = 'blue', bold = true, nocombine = true })
        --	end
    }
}

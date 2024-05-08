return {
  { -- Autoformat
    'stevearc/conform.nvim',
     event = { "BufWritePre" },
     cmd = { "ConformInfo" },
     lazy = true,
     keys = {
      {
        '<leader>x',
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = '',
        desc = 'CONFORM ACTIVE BUFFER',
      },
    },
    opts = {
      notify_on_error = true,
   --   format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
     --   local disable_filetypes = { c = true, cpp = true }
     --   return {
      --    timeout_ms = 500,
      --    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --    }
  --    end,
      format_on_save = {
    -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
        },
      },
      formatters_by_ft = {
        lua = { 'stylua', 'lua', 'vim-language-server' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
    init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

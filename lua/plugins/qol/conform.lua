return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    --format_on_save = function(bufnr)
    --  -- Disable "format_on_save lsp_fallback" for languages that don't
    --  -- have a well standardized coding style. You can add additional
    --  -- languages here or re-enable it for the disabled ones.
    --  local disable_filetypes = { c = true, cpp = true }
    --  return {
    --    timeout_ms = 500,
    --    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --  }
    --end,
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        html = { 'djlint' },
        go = { 'gofmt', 'goimports' },
        c = { 'clang_format' },
        cpp = { 'clang_format' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
      formatters = {
        clang_format = {
          prepend_args = { '--style=file', '--fallback-style=LLVM' },
        },
        shfmt = {
          prepend_args = { '-i', '4' },
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

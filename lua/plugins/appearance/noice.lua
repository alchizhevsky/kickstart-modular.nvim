return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      routes = {
        {
          filter = { find = 'Copilot' },
          opts = { skip = true },
        },
      },
      views = {
        cmdline_popup = {
          position = { row = 5, col = '50%' },
          size = { width = 60, height = 'auto' },
          border = { style = 'rounded', padding = { 0, 1 } },
          win_options = {
            winblend = 0,
            winhighlight = {
              Normal = 'Normal',
              FloatBorder = 'DiagnosticInfo',
            },
          },
        },
        popupmenu = {
          relative = 'editor',
          position = { row = 8, col = '50%' },
          size = { width = 60, height = 10 },
          border = { style = 'rounded', padding = { 0, 1 } },
          win_options = {
            winblend = 0,
            winhighlight = {
              Normal = 'Normal',
              FloatBorder = 'DiagnosticInfo',
            },
          },
        },
      },
    }
  end,
}

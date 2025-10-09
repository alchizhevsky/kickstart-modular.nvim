return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      cmdline = {
        enabled = true,
        view = 'cmdline_popup', -- centered popup
      },
      views = {
        cmdline_popup = {
          position = { row = 5, col = '50%' },
          size = { width = 60, height = 'auto' },
          border = { style = 'rounded', padding = { 0, 1 } },
        },
        cmdline_popupmenu = {
          relative = 'editor',
          position = { row = 8, col = '50%' },
          size = { width = 60, height = 10 },
          border = { style = 'rounded', padding = { 0, 1 } },
        },
      },

      -- 👇 These two lines are the important ones
      throttle = 100, -- smooth out redraw bursts in 0.11+
      routes = {
        {
          filter = { event = 'cmdline_hide' }, -- ignore the premature hide
          opts = { skip = true },
        },
      },
    }
  end,
}

return {
  'catppuccin/nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = false,
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
-- vim: ts=2 sts=2 sw=2 et

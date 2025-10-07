return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = '▏', -- for spaces
        tab_char = '▏', -- for tabs
      },
      whitespace = {
        highlight = { 'Whitespace' },
      },
    },
  },
}

return {
  'folke/snacks.nvim',
  --move noice notifications to the bottom
  ---@type snacks.Config
  opts = {
    notifier = {
      enable = true,
      top_down = false,
    },
  },
}

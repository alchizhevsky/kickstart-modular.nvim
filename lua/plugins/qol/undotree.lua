return {
  'mbbill/undotree',
  lazy = false, -- load on startup or set to true with cmd lazy load
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>u', '<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>', { noremap = true, silent = true })
  end,
}

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  cmd = { 'CopilotChat', 'CopilotChatOpen', 'CopilotChatClose' },
  dependencies = { 'github/copilot.lua' },
  config = function()
    require('copilot-chat').setup {
      panel = {
        position = 'right',
        size = { height = 15 },
        border = 'rounded',
      },
      chat = {
        keymaps = {
          close = '<C-c>',
          submit = '<CR>',
        },
      },
    }
  end,
}

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
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
      cmds = {
        'CopilotChatToggle',
        'CopilotChatStop',
        'CopilotChatReset',
        --TODO: implement
        --'CopilotChatSave <name>?',
        --'CopilotChatLoad <name>?',
        'CopilotChatExplain',
        'CopilotChatReview',
        'CopilotChatFix',
        'CopilotChatOptimize',
        'CopilotChatDocs',
        'CopilotChatTest',
        'CopilotChatCommit',
      },
    },
    config = function()
      vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<cr>', { desc = 'Toggle CopilotChat' })
      vim.keymap.set('n', '<leader>cq', '<cmd>CopilotChatStop<cr>', { desc = 'Interrupt response' })
      vim.keymap.set('n', '<leader>cr', '<cmd>CopilotChatReset<cr>', { desc = 'Document selection' })

      vim.keymap.set('v', '<leader>ce', '<cmd>CopilotChatExplain<cr>', { desc = 'Explain selection' })
      vim.keymap.set('v', '<leader>cr', '<cmd>CopilotChatReview<cr>', { desc = 'Review selection' })
      vim.keymap.set('v', '<leader>cf', '<cmd>CopilotChatFix<cr>', { desc = 'Fix selection' })
      vim.keymap.set('v', '<leader>co', '<cmd>CopilotChatOptimize<cr>', { desc = 'Optimize selection' })
      vim.keymap.set('v', '<leader>cd', '<cmd>CopilotChatDocs<cr>', { desc = 'Document selection' })
      vim.keymap.set('v', '<leader>ct', '<cmd>CopilotChatTest<cr>', { desc = 'Write tests for selection' })
      vim.keymap.set('v', '<leader>cm', '<cmd>CopilotChatCommit<cr>', { desc = 'Commit selection' })
    end,
  },
}

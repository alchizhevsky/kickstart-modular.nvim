-- Inline Code Execution: code_runner.nvim
return {
  'CRAG666/code_runner.nvim',
  config = function()
    local ok, runner = pcall(require, 'code_runner')
    if not ok then
      return
    end

    runner.setup {
      mode = 'term',
      focus = true,
      startinsert = false,
      filetype = {
        python = 'python3 -u',
        cpp = 'g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt',
        c = 'gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt',
        go = 'go run .',
        rust = 'cargo run',
        sh = 'bash',
        lua = 'lua',
      },
    }

    vim.keymap.set('n', '<leader>os', '<cmd>RunCode<CR>', { desc = 'Run current file' })
    vim.keymap.set('v', '<leader>os', '<cmd>RunCode<CR>', { desc = 'Run selected code' })
  end,
}

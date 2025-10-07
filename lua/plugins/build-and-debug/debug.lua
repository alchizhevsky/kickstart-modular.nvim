-- Debugging: nvim-dap + UI + Mason Integration
return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'jay-babu/mason-nvim-dap.nvim',
      'stevearc/overseer.nvim', -- integrates with DAP via preLaunchTask
    },
    config = function()
      local dap_ok, dap = pcall(require, 'dap')
      local dapui_ok, dapui = pcall(require, 'dapui')
      if not (dap_ok and dapui_ok) then
        return
      end

      require('mason-nvim-dap').setup { automatic_installation = true }
      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- Example C++ config with Overseer integration
      dap.configurations.cpp = {
        {
          name = 'Debug with build',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          preLaunchTask = 'build', -- 🧠 triggers Overseer before debugging
        },
      }

      -- Keymaps (<leader>d…)
      local map = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { desc = 'DAP: ' .. desc })
      end

      map('<leader>db', dap.toggle_breakpoint, 'Toggle Breakpoint')
      map('<leader>dc', dap.continue, 'Start / Continue Debug')
      map('<leader>do', dap.step_over, 'Step Over')
      map('<leader>di', dap.step_into, 'Step Into')
      map('<leader>du', dap.step_out, 'Step Out')
      map('<leader>dr', dap.restart, 'Restart Session')
      map('<leader>dq', dap.terminate, 'Quit Debugger')
    end,
  },

  ---------------------------------------------------------------------------
  -- 💻 Inline Code Execution: code_runner.nvim
  ---------------------------------------------------------------------------
  {
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

      vim.keymap.set('n', '<leader>rr', '<cmd>RunCode<CR>', { desc = 'Run current file' })
      vim.keymap.set('v', '<leader>rr', '<cmd>RunCode<CR>', { desc = 'Run selected code' })
    end,
  },
}

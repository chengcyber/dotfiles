local dap = require('dap')

-- dap keymappings
vim.keymap.set('n', '<leader>bb', function()
  dap.toggle_breakpoint()
end)
vim.keymap.set('n', '<leader>bc', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint Condition: '))
end)
vim.keymap.set('n', '<leader>bl', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point msg:'))
end)
-- debug
vim.keymap.set('n', '<F5>', function()
  dap.continue()
end)
-- open REPL
vim.keymap.set('n', '<F6>', function()
  dap.open()
end)
-- step over
vim.keymap.set('n', '<F10>', function()
  dap.step_over()
end)
-- step into
vim.keymap.set('n', '<F11>', function()
  dap.step_into()
end)
-- step out
vim.keymap.set('n', '<F12>', function()
  dap.step_out()
end)

vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define('DapStopped', { text='⏭', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

-- dapui
local dapui = require('dapui')
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})
vim.keymap.set('n', '<leader>dd', function()
  dapui.toggle()
end)


-- javascript
-- local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/site/pack/packer/opt/vscode-js-debug"
local DEBUGGER_PATH = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"

require("dap-vscode-js").setup {
    node_path = "node",
    debugger_path = DEBUGGER_PATH,
    -- debugger_cmd = { "js-debug-adapter" },
    adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

-- custom adapter for running tasks before starting debug
-- https://www.reddit.com/r/neovim/comments/y7dvva/typescript_debugging_in_neovim_with_nvimdap/
local custom_adapter = 'pwa-node-custom'
 dap.adapters[custom_adapter] = function(cb, config)
    if config.preLaunchTask then
        local async = require('plenary.async')
        local notify = require('notify').async

        async.run(function()
            ---@diagnostic disable-next-line: missing-parameter
            notify('Running [' .. config.preLaunchTask .. ']').events.close()
        end, function()
            vim.fn.system(config.preLaunchTask)
            config.type = 'pwa-node'
            dap.run(config)
        end)
    end
end

for _, language in ipairs { "typescript", "javascript" } do
    dap.configurations[language] = {
        {
            name = 'Launch',
            type = 'pwa-node',
            request = 'launch',
            program = '${file}',
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        },
                {
            name = 'Debug Main Process (Electron)',
            type = 'pwa-node',
            request = 'launch',
            program = '${workspaceFolder}/node_modules/.bin/electron',
            args = {
                '${workspaceFolder}/dist/index.js',
            },
            outFiles = {
                '${workspaceFolder}/dist/*.js',
            },
            resolveSourceMapLocations = {
                '${workspaceFolder}/dist/**/*.js',
                '${workspaceFolder}/dist/*.js',
            },
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            name = 'Compile & Debug Main Process (Electron)',
            type = custom_adapter,
            request = 'launch',
            preLaunchTask = 'npm run build-ts',
            program = '${workspaceFolder}/node_modules/.bin/electron',
            args = {
                '${workspaceFolder}/dist/index.js',
            },
            outFiles = {
                '${workspaceFolder}/dist/*.js',
            },
            resolveSourceMapLocations = {
                '${workspaceFolder}/dist/**/*.js',
                '${workspaceFolder}/dist/*.js',
            },
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
    }
end


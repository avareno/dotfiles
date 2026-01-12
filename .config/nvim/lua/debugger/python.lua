local dap = require("dap")
local dapui = require("dapui")

dap.adapters.python = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter", -- Path to debugpy adapter
}

-- Setup UI
dapui.setup({
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.40 }, -- Show variables (useful for Rust & Pandas)
                { id = "breakpoints", size = 0.20 },
                { id = "stacks", size = 0.20 },
                { id = "watches", size = 0.20 }, -- Watches useful for both Python and Rust
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                { id = "repl", size = 0.50 }, -- REPL (for Python Debugging)
                { id = "console", size = 0.50 },
            },
            size = 10,
            position = "bottom",
        },
    },
})
dap.configurations.python = {
    {
        name = "Launch Python Script",
        type = "python",
        request = "launch",
        program = function()
            -- Default to the currently open file
            local file_path = vim.fn.expand("%:p")

            -- Debug info
            print("Checking script path: " .. file_path)

            -- Check if the file exists
            if vim.fn.filereadable(file_path) == 1 then
                print("Script found: " .. file_path) -- Print if file is found
                return file_path
            else
                -- Prompt for input if the script doesn't exist
                print("Script not found. Please provide the correct path.")
                return vim.fn.input("Path to Python script: ", file_path, "file")
            end
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        pythonPath = function()
            -- Automatically determine the Python interpreter
            local venv_path = os.getenv("VIRTUAL_ENV")
            if venv_path then
                return venv_path .. "/bin/python"
            else
                return "python" -- Use system Python if no virtual environment is active
            end
        end,
    },
    {
        name = "Launch with Arguments",
        type = "python",
        request = "launch",
        program = "${file}",
        args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " ")
        end,
        console = "integratedTerminal",
        justMyCode = false, -- Important for debugging library code
    },
}

return {}

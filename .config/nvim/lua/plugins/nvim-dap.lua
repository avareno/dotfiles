return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui", -- UI for nvim-dap
            {
                "jay-babu/mason-nvim-dap.nvim", -- Install DAP debuggers via Mason
                "nvim-neotest/nvim-nio", -- Add this dependency for nvim-dap-ui
                opts = {
                    ensure_installed = { "python", "codelldb", "node2" }, -- List of debuggers to install
                    automatic_installation = true, -- Automatically install debuggers
                },
            },
        },
        config = function()
            -- Basic DAP setup
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
            vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
            vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
            vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
            vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
            vim.keymap.set("n", "<Leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Set Conditional Breakpoint" })
            vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
            vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run Last Debugging Session" })
            vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Terminate Debugging" })

            require("debugger.rust")
            require("debugger.python")
        end,
    },
}

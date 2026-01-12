return {
    "akinsho/flutter-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
        local flutter = require("flutter-tools")
        flutter.setup({
            -- widget_guides = {
            --   enabled = true,
            -- },
            closing_tags = {
                highlight = "Comment",
                prefix = "// ",
                enabled = true,
            },
            dev_log = {
                enabled = true,
                open_cmd = "tabedit",
            },
        })
        vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Devices" })
        vim.keymap.set("n", "<leader>fe", "<cmd>FlutterEmulators<cr>", { desc = "Emulators" })
        vim.keymap.set("n", "<leader>fr", "<cmd>FlutterReload<cr>", { desc = "Reload" })
        vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Restart" })
        vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Quit" })
        vim.keymap.set("n", "<leader>fD", "<cmd>FlutterDetach<cr>", { desc = "Detach" })
        vim.keymap.set("n", "<leader>fD", "<cmd>FlutterDetach<cr>", { desc = "Detach" })
        vim.keymap.set("n", "<leader>fo", "<cmd>FlutterOutlineToggle<cr>", { desc = "Widget Tree" })
        vim.keymap.set("n", "<leader>ft", "<cmd>FlutterDevTools<cr>", { desc = "Dev Tools" })
        vim.keymap.set("n", "<leader>fs", "<cmd>FlutterRun<cr>", { desc = "Run" })
    end,
}

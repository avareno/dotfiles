-- Keybinds guide
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {},
    config = function()
        local wk = require("which-key")
        wk.add({
            -- { "<leader>x",  group = "Trouble" },
            { "<leader>G", group = "Go Lang" },
            { "<leader>ca", group = "Code action" },
            { "<leader>t", group = "Test" },
            { "<leader>g", group = "Git" },
            { "<leader>l", group = "Laravel" },
            { "<leader>d", group = "Debugger" },
            { "<leader>e", group = "Errors" },
        })
    end,
}

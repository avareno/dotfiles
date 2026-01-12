return {
    "catppuccin/bufferline.nvim",
    after = "catppuccin",
    config = function()
        require("bufferline").setup({
            -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
            options = {
                hover = {
                    enabled = true,
                    delay = 0,
                    reveal = { "close" },
                },
            },
        })
        vim.keymap.set({ "n" }, "<Tab>", ":BufferLineCycleNext<CR>")
        vim.keymap.set({ "n" }, "<S-Tab>", ":BufferLineCyclePrev<CR>")
        -- vim.keymap.set({ "n", "v" }, "<leader>b", ":BufferLinePick<CR>")
        vim.keymap.set({ "n", "v" }, "<leader>w", ":bd<CR>", { desc = "Close Buffer" })
    end,
}

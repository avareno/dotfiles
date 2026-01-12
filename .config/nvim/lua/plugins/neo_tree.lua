return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window
        },
        config = function()
            vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
            vim.keymap.set("n", "<C-m>", ":Neotree filesystem close left<CR>", {})

            require("neo-tree").setup({
                filesystem = {
                    filtered_items = {
                        visible = true, -- Show all filtered items (including hidden)
                        hide_dotfiles = false, -- Show dotfiles (e.g., .git, .config)
                        hide_gitignored = false, -- Optional: show gitignored files
                    },
                    follow_current_file = {
                        enabled = true,
                    },
                },
                window = {
                    mappings = {
                        ["zh"] = "toggle_hidden", -- Allow toggling hidden files
                    },
                },
            })
        end,
    },
}

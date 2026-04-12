return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- ["<C-h>"] = "which_key"
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })

            -- Load extensions
            require("telescope").load_extension("ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
}

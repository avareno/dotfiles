return {

    -- Alpha (Dashboard)
    {
        "goolord/alpha-nvim",
        lazy = true,
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Colorscheme
    {
        "catppuccin/nvim",
    },

    -- Hop (Better Navigation)
    {
        "phaazon/hop.nvim",
        lazy = true,
    },

    -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Toggle Term
    -- Added this plugin.
    {
        -- amongst your other plugins
        { "akinsho/toggleterm.nvim", version = "*", config = true },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
    },

    -- Which-key
    {
        "folke/which-key.nvim",
        lazy = true,
    },
}

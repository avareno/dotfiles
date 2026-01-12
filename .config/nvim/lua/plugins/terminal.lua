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

    -- Language Support
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" }, -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    },

    -- Nvimtree (File Explorer)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- Telescope (Fuzzy Finder)
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
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

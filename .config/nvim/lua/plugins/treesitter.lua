return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- ADDED: Load on file open
    config = function()
        -- Treesitter configuration
        local ts_config = require("nvim-treesitter.configs")
        ts_config.setup({
            auto_install = true,
            ensure_installed = {
                "lua",
                "javascript",
                "markdown",
                "markdown_inline",
                "html",
                "rust",
                "go",
                "php",
                "python",
                "java",
                "dart",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false, -- Tree-sitter only
            },
            indent = {
                enable = true,
            },
        })
    end,
}

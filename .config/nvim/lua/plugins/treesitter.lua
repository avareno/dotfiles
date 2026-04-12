return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
        require("nvim-treesitter.configs").setup({
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
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
        })
    end,
}

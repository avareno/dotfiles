return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if ok then
            configs.setup({
                auto_install = true,
                ensure_installed = {
                    "lua", "javascript", "markdown", "markdown_inline",
                    "html", "rust", "go", "php", "python", "java", "dart",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        else
            -- If legacy module is missing (v1.0.0+), use pcall to safely start treesitter
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local bufnr = args.buf
                    local ft = vim.bo[bufnr].filetype
                    -- Only attempt to start if we have a valid filetype and a parser exists
                    if ft and ft ~= "" then
                        local lang = vim.treesitter.language.get_lang(ft) or ft
                        -- Check if the parser is actually installed/available
                        local has_parser = pcall(vim.treesitter.get_parser, bufnr, lang)
                        if has_parser then
                            pcall(vim.treesitter.start, bufnr, lang)
                        end
                    end
                    -- Indentation is safer to set
                    pcall(function()
                        vim.bo[bufnr].indentexpr = "v:lua.vim.treesitter.indentexpr()"
                    end)
                end,
            })
            
            local ts_ok, ts = pcall(require, "nvim-treesitter")
            if ts_ok and type(ts) == "table" and ts.install then
                ts.install({
                    "lua", "javascript", "markdown", "markdown_inline",
                    "html", "rust", "go", "php", "python", "java", "dart",
                })
            end
        end
    end,
}

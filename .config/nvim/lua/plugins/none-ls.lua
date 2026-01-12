-- Formatters
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces", "--indent-width", "4" }
                }),
                null_ls.builtins.formatting.prettierd.with({
                    extra_args = { "--tab-width", "4" }
                }),
                null_ls.builtins.formatting.sql_formatter.with({
                    extra_args = { "--indent", "4" }
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort.with({
                    extra_args = { "--indent", "4", "--profile", "black" }
                }),
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "-style={IndentWidth: 4}" }
                }),
            },
        })
        vim.keymap.set({ "n", "i", "v" }, "<A-S-f>", vim.lsp.buf.format, {})
    end,
}

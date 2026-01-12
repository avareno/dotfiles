-- LSP Configuration Loader
return {
    {
        "nikvdp/ejs-syntax",
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "sqlls",
                    "yamlls",
                    -- "rust_analyzer",
                    -- "ts_ls",
                    -- "eslint",
                    -- "html",
                    -- "cssls",
                    -- "tailwindcss",
                },
                auto_install = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities, -- This is what was missing!
                    })
                end,

                -- Python-specific config
                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic", -- or "off" if too strict
                                    autoSearchPaths = true,
                                    useLibraryCodeForTypes = true,
                                    diagnosticMode = "workspace",
                                },
                            },
                        },
                    })
                end,

                -- Lua-specific config (for neovim itself)
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }, -- Recognize 'vim' global
                                },
                            },
                        },
                    })
                end,
            })

            -- Load language-specific configs if they exist
            local lsp_configs = { "js", "rust", "dart" }
            for _, lang in ipairs(lsp_configs) do
                local ok, mod = pcall(require, "lsp." .. lang)
                if ok and type(mod.setup) == "function" then
                    mod.setup()
                end
            end

            -- Diagnostic config
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" }) -- Changed from <C-h>
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" }) -- ADDED
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" }) -- ADDED
        end,
    },
}

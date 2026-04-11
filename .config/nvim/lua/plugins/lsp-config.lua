-- LSP Configuration Loader
return {
    {
        "nikvdp/ejs-syntax",
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- Initialize Mason first
            require("mason").setup()

            -- Then Mason-LSPConfig (v2.x)
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "sqlls",
                    "yamlls",
                },
                -- Let mason-lspconfig automatically enable servers when their config is defined
                automatic_enable = true,
            })

            -- Setup capabilities for autocompletion
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            -- In Neovim 0.12+ (and 0.11), the native way is to use vim.lsp.config
            -- and vim.lsp.enable. We use nvim-lspconfig to populate the defaults first.
            local configs = require("lspconfig.configs")

            local servers = { "lua_ls", "pyright", "sqlls", "yamlls" }
            
            for _, server in ipairs(servers) do
                local opts = {
                    capabilities = capabilities,
                }

                -- Python-specific settings
                if server == "pyright" then
                    opts.settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "basic",
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                            },
                        },
                    }
                end

                -- Lua-specific settings
                if server == "lua_ls" then
                    opts.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    }
                end

                -- This is the modern 0.12 way to avoid the 'lspconfig framework' warning
                -- We get the default configuration from lspconfig but use native API to enable it
                local config = configs[server]
                if config then
                    -- Merge our opts with the default config
                    local final_config = vim.tbl_deep_extend("force", config.default_config, opts)
                    
                    -- Native Neovim LSP configuration
                    vim.lsp.config(server, final_config)
                    vim.lsp.enable(server, true)
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
            vim.keymap.set("n", "<leader>df", vim.lsp.buf.hover, { desc = "Hover Documentation" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Find References" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
        end,
    },
}

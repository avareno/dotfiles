local lspconfig = require("lspconfig")

local M = {}

M.setup = function()
    lspconfig.rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
                check = {
                    command = "clippy", -- or "check"
                },
                diagnostics = {
                    disabled = {
                        "unresolved-proc-macro",
                    },
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    })
end

return M

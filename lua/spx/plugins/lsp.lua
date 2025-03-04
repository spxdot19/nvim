return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        { "williamboman/mason-lspconfig.nvim", opts = {} },
        "saghen/blink.cmp",
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }

        })
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = { "lua_ls", "rust_analyzer" },
            handlers = {
                function(server_name)
                    local capabilities = require("blink.cmp").get_lsp_capabilities()
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end
            }
        })
    end
}

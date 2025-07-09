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


        -- 1
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp", { clear = true }),
            callback = function(args)
                -- 2
                vim.api.nvim_create_autocmd("BufWritePre", {
                    -- 3
                    buffer = args.buf,
                    callback = function()
                        -- 4 + 5
                        vim.lsp.buf.format { async = false, id = args.data.client_id }
                    end,
                })
            end
        })

        vim.diagnostic.config(
            {
                -- virtual_text = true,
                virtual_lines = true,
                severity_sort = true,
                underline = true,
            }
        )
    end
}

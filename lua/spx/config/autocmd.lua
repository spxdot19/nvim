local spx = vim.api.nvim_create_augroup("spxdot19", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
    group = spx,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "man" },
    command = "wincmd L",
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = spx,
--     callback = function(args)
--         vim.api.nvim_create_autocmd("BufWritePre", {
--             buffer = args.buf,
--             callback = function()
--                 vim.lsp.buf.format { async = false, id = args.data.client_id }
--             end,
--         })
--     end
-- })
--

vim.diagnostic.config(
    {
        -- virtual_text = true,
        virtual_lines = true,
        severity_sort = true,
        underline = true,
    }
)

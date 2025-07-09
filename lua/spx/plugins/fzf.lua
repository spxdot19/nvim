return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    config = function()
        local fzf = require("fzf-lua")

        vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Buffers" })

        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Fzf Files" })

        vim.keymap.set("n", "<leader>lg", fzf.live_grep, { desc = "Live Grep" })

        vim.keymap.set("n", "<leader>km", fzf.keymaps, { desc = "Fzf Keymap" })
    end
}

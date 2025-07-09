local g = vim.g
local map = vim.keymap.set
g.mapleader = " "

map("n", "<leader>rm", vim.cmd.Ex)
map("i", "jk", "<Esc>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>v", "<C-W>v")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")

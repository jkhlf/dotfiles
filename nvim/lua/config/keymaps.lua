vim.g.mapleader = " "

local map = vim.keymap.set

-- Navega├º├úo entre janelas
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")


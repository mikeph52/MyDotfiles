local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "", opts)             -- unbind space
vim.g.mapleader = " "                     -- set leader to space

-- Quick save
map("n", "<leader>w", ":w<CR>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


vim.g.mapleader = " "

vim.keymap.set("n", "<leader>n", "<Cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>m", "<Cmd>NvimTreeFindFile<CR>")

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-c>", "<Cmd>close<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprev<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>dd", "<Cmd>Telescope diagnostics<CR>")

-- Trouble
vim.keymap.set("n", "<leader>tt", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>tr", function() require("trouble").refresh() end)
vim.keymap.set("n", "<leader>tq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)


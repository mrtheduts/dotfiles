-- Set leader
vim.g.mapleader = " "

-- Open nvim file navigator
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in a sane position
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Do not store replaced to register -- BROKEN
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- Stores yanked to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Deleting to void
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Format current buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Rename current symbol
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- jk is ESC
vim.keymap.set("i", "jk", "<ESC>")

-- Jump easily between splits
-- Up
vim.keymap.set("n", "<C-S-k>", "<C-w>k")
-- Down
vim.keymap.set("n", "<C-S-j>", "<C-w>j")
-- Right
vim.keymap.set("n", "<C-S-l>", "<C-w>l")
-- Left
vim.keymap.set("n", "<C-S-h>", "<C-w>h")

-- Vertical Split
vim.keymap.set("n", "<leader>V", ":vsp<CR>")
-- Horizontal Split
vim.keymap.set("n", "<leader>S", ":sp<CR>")

-- Close Split
vim.keymap.set("n", "<C-c>", ":close<CR>")

-- Switch between buffers
vim.keymap.set("n", "<A-TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprev<CR>")

-- Close buffer
-- vim.keymap.set("n", "<leader>c", ":bp<bar>sp<bar>bn<bar>bd<CR>")

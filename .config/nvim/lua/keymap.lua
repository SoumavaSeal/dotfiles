-- Setting up Leader Key
vim.g.mapleader = ","

-- Open File Manager
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Toggle between windows.
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- Move Buffers
vim.keymap.set("n", "<leader>H", ":wincmd H<CR>")
vim.keymap.set("n", "<leader>J", ":wincmd J<CR>")
vim.keymap.set("n", "<leader>K", ":wincmd K<CR>")
vim.keymap.set("n", "<leader>L", ":wincmd L<CR>")


-- Source the current file.
vim.keymap.set("n", "<leader>s", ":so %<CR>")

-- Move multiple lines.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- Select all.
vim.keymap.set("n", "C-a", "ggVG")

-- Telescope Keymaps
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>gl", ":Telescope diagnostics<CR>")

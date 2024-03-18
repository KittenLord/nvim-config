vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>ep", vim.cmd.Ex)
vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>qs", vim.cmd.QuickScopeToggle)

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

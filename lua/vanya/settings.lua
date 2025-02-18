vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smarttab = true

-- changed my mind
-- vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.g.NERDTreeHijackNetrw = 0

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev) vim.bo[ev.buf].commentstring = "// %s" end,
  pattern = "cs",
})
vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev) vim.bo[ev.buf].commentstring = "// %s" end,
  pattern = "c",
})

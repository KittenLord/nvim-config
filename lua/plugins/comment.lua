return {
    "numToStr/Comment.nvim",
    config = function ()
        require("Comment").setup({})
        vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
    end,
    lazy = false,
}

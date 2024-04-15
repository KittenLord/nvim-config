-- why doesnt this work

return {
    "Myzel394/jsonfly.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").load_extension("jsonfly")
        vim.keymap.set("n", "<leader>js", "<cmd>Telescope jsonfly<CR>")
    end
}

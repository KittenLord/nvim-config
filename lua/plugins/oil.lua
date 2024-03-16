return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("oil").setup({
            default_file_explorer = false
        })

        vim.keymap.set("n", "<leader>ep", "<cmd>Oil<CR>")
    end
}

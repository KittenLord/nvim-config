return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "%.meta",
                    "lazy%-lock.json",
                }
            },
        })

        local tscope = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fs", tscope.find_files, {})
        vim.keymap.set("n", "<leader>fg", tscope.live_grep, {})
    end
}

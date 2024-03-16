return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function ()
        local sign = require("lsp_signature")
        sign.setup({
            always_trigger = true
        })

        vim.keymap.set({"i", "n"}, "<C-k>", function()
            sign.toggle_float_win()
        end)
    end
}

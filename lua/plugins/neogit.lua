return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function ()
    -- local neogit = require("neogit")
    -- vim.keymap.set("n", "<leader>gh", neogit.open({ kind = "split" }))
    vim.keymap.set("n", "<leader>gh", "<CMD>Neogit kind=split<CR>")
end
}

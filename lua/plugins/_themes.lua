function Funny()
    require("vscode").setup({
        transparent = true
    })
    vim.cmd.colorscheme("vscode")

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
end

function DefaultVscode()
    require("vscode").setup({})
    vim.cmd.colorscheme("vscode")
end

return {
    "nyoom-engineering/oxocarbon.nvim",
    dependencies = {
        "Mofiqul/vscode.nvim", -- the only good one lol
        "ramojus/mellifluous.nvim",
        "bluz71/vim-moonfly-colors",
        "olivercederborg/poimandres.nvim",
    },

    config = function()
        require("vscode").load()
        require("poimandres").setup()

        Funny()
        -- DefaultVscode()
    end

}


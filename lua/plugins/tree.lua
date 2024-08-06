-- return {}
return {
    "nvim-tree/nvim-tree.lua",
    config = function ()
        require("nvim-tree").setup({
            -- disable_netrw = true,
            -- hijack_netrw = true,
            view = {
                width = 25
            },
            filters = {
                custom = {
                    "*.meta"
                }
            },
            renderer = {
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "*",
                        },
                    },
                },
            },
        })
    end
}

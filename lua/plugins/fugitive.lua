return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set("n", "<leader>gh", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gb", function()
            local branch = vim.fn.input("Branch: ")
            vim.cmd.Git("branch " .. branch)
            vim.cmd.Git("checkout " .. branch)
        end)

        local fugitiveGroup = vim.api.nvim_create_augroup("fugitiveGroup", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = fugitiveGroup,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "A", function() vim.cmd.Git("add .") end, opts)

                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git({'pull',  '--rebase'})
                end, opts)
                --
                -- -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- -- needed if i did not set the branch up correctly
                -- vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            end,
        })
    end
}

return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    -- https://www.reddit.com/r/neovim/comments/1b1kw8d/help_configuring_markdownpreviewnvim_with_custom/
    -- https://github.com/iamcco/markdown-preview.nvim/issues/148
    config = function ()
        -- vim.cmd([[do FileType]])
        vim.cmd([[
            function OpenMarkdownPreview (url)
                let cmd = "firefox --new-window " . shellescape(a:url) . " &"
                silent call system(cmd)
            endfunction
            let g:mkdp_echo_preview_url = 1
            let g:mkdp_browserfunc = 'OpenMarkdownPreview'
        ]])
        -- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
        -- vim.g.mkdp_port = 8080
    end
}

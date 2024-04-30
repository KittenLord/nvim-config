return {
    "nativerv/cyrillic.nvim",
    event = { "VeryLazy" },
    config = function ()
        require("cyrillic").setup({
            no_cyrillic_abbrev = false
        })

        vim.cmd [[
            cabbrev <expr> цф	getcmdtype()==':' && getcmdline()=="цф"	? "wa"	: "цф"
            cabbrev <expr> цйф	getcmdtype()==':' && getcmdline()=="цйф"	? "wqa"	: "цйф"
        ]]

        vim.keymap.set("", ";", ";")
        vim.keymap.set("", ",", ",")
    end
}

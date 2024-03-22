return {
    "MarcHamamji/runner.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    config = function ()
        local runner = require("runner")
        local shell = require("runner.handlers.helpers").shell_handler

        runner.setup()
        runner.set_handler("cs", shell("dotnet run"), false)

        vim.keymap.set("n", "<leader>r", vim.cmd.Run)
    end
}

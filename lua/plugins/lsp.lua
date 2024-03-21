return {
    "neovim/nvim-lspconfig",

    dependencies = {

        -- Mason
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",


        -- Autocomplete and stuff idk
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",

        -- C#
        -- TODO: Try out omnisharp now that it works
        "Decodetalkers/csharpls-extended-lsp.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local mlc = require("mason-lspconfig")
        local cmp = require("cmp")

        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
        require("fidget").setup({})

        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

        local default_setup = function(server)
            lspconfig[server].setup({
                capabilities = lsp_capabilities
            })
        end

        mason.setup({})
        mlc.setup({
            ensure_installed = { "lua_ls" },
            handlers = {
                default_setup,
                lua_ls = function()
                    lspconfig.lua_ls.setup({
                        capabilities = lsp_capabilities,
                        settings = {
                            Lua = { diagnostics = { globals = { "vim" } } }
                        }
                    })
                end,
                csharp_ls = function ()
                    local handler = require("csharpls_extended").handler
                    lspconfig.csharp_ls.setup({
                        capabilities = lsp_capabilities,
                        handlers = {
                            ["textDocument/definition"] = handler,
                            ["textDocument/typeDefinition"] = handler,
                        }
                    })
                end
            }
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                local opts = { buffer = event.buf }

                require("lsp_signature").on_attach()

                vim.keymap.set({ "n", "i" }, 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                -- ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

    end
}

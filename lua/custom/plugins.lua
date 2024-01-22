local overrides = require("custom.configs.overrides")
local lspc = require "plugins.configs.lspconfig"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- Install Copilot
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = overrides.copilot,
        config = function ()
            vim.g.copilot_no_tap_map = true
        end
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
                config = function()
                    require("copilot_cmp").setup()
                end,
            },
        },
        opts = {
            sources = {
                { name = "copilot", group_index = 2 },
                { name = "crates", group_index = 2 },
                { name = "nvim_lsp",  group_index = 2 },
                { name = "luasnip",  group_index = 2 },
                { name = "buffer",   group_index = 2 },
                { name = "nvim_lua", group_index = 2 },
                { name = "path",     group_index = 2 },
            },
        },
    },

    {
        "mfussenegger/nvim-dap",
        config = function()
            require("core.utils").load_mappings("dap")
        end,
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim"
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            }
        }
    },

    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },

    -- {
    --     "simrat39/rust-tools.nvim",
    --     ft = "rust",
    --     dependencies = "neovim/nvim-lspconfig",
    --     opts = function()
    --         return require("custom.configs.rust-tools")
    --     end,
    --     config = function(_, opts)
    --         require("rust-tools").setup(opts)
    --     end,
    -- },

    {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },
        dependencies = "nvim-lua/plenary.nvim",
        config = function(_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
            require("core.utils").load_mappings("crates")
        end,
    },

    {
        "tpope/vim-fugitive",
        cmd = "Git",
        config = function()
            require("core.utils").load_mappings("fugitive")
        end,
        dependencies = "lewis6991/gitsigns.nvim"
    }

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins

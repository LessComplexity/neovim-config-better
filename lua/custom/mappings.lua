---@type MappingsTable
local M = {}

M.general = {
    n = {
        -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
        -- ["<C-j>"] = { ":m .+1<CR>==", "move line down" },
        -- ["<C-k>"] = { ":m .-2<CR>==", "move line up" },
    },
    v = {
        [">"] = { ">gv", "indent"},
        ["<"] = { "<gv", "unindent"},
        ["<A-j>"] = { ":m '>+1<CR>gv=gv", "move line down" },
        ["<A-k>"] = { ":m '<-2<CR>gv=gv", "move line up" },
    },
}

-- more keybinds!
M.dap = {
    plugin = true,
    n = {
        ["<leader>dc"] = { "<cmd>lua require('dap').continue()<CR>", "continue" },
        ["<leader>dr"] = { "<cmd>lua require('dap').repl.open()<CR>", "repl" },
        ["<leader>db"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "toggle breakpoint" },
        ["<leader>dB"] = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "conditional breakpoint" },
        ["<leader>dl"] = { "<cmd>lua require('dap').run_last()<CR>", "run last" },
        ["<leader>dn"] = { "<cmd>lua require('dap').step_over()<CR>", "step over" },
        ["<leader>di"] = { "<cmd>lua require('dap').step_into()<CR>", "step into" },
        ["<leader>do"] = { "<cmd>lua require('dap').step_out()<CR>", "step out" },
        ["<leader>du"] = { "<cmd>lua require('dapui').toggle()<CR>", "toggle ui" },
    },
}

M.fugitive = {
    n = {
        ["<leader>gs"] = { "<cmd>Git<CR>", "git status" },
        ["<leader>gc"] = { "<cmd>Git commit<CR>", "git commit" },
        ["<leader>gp"] = { "<cmd>Git push<CR>", "git push" },
        ["<leader>gd"] = { "<cmd>Gvdiffsplit<CR>", "git diff" },
        ["<leader>gb"] = { "<cmd>Git blame<CR>", "git blame" },
        ["<leader>gl"] = { "<cmd>Git log<CR>", "git log" },
        ["<leader>gr"] = { "<cmd>Gread<CR>", "git read" },
        ["<leader>gw"] = { "<cmd>Gwrite<CR>", "git write" }
    },
}

M.crates = {
    n = {
        ["<leader>cr"] = { "<cmd>Cargo run<CR>", "cargo run" },
        ["<leader>cb"] = { "<cmd>Cargo build<CR>", "cargo build" },
        ["<leader>ct"] = { "<cmd>Cargo test<CR>", "cargo test" },
        ["<leader>cu"] = {
            function()
                require("crates").upgrade_all_crates()
            end,
            "cargo update",
        }
    },
}

return M

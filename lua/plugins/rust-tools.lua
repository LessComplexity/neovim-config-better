return {
  "simrat39/rust-tools.nvim",
  lazy = true,
  opts = function()
    return {
      dap = {
        adapter = {
          type = "executable",
          command = "lldb-vscode",
          name = "codelldb",
        },
      },
      tools = {
        on_initialized = function()
          vim.cmd([[
                augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
              ]])
        end,
      },
    }
  end,

  keys = {
    { "K", "<cmd>lua require('rust-tools.hover_actions').hover_actions()<cr>", desc = "Rust Actions" },
    {
      "A",
      "<cmd>lua require('rust-tools.code_action_group').code_action_group()<cr>",
      desc = "Some more rust",
    },
  },

  config = function() end,
}

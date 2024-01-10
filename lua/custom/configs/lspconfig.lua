local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "intelephense", "tailwindcss" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- 
-- lspconfig.pyright.setup { blabla}
--
lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
}

lspconfig.volar.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "vue", "javascript", "typescript" },
}

lspconfig.rust_analyzer.setup {
   on_attach = on_attach,
   capabilities = capabilities,
   filetypes = { "rust" },
   root_dir = lspconfig.util.root_pattern("Cargo.toml"),
   settings = {
       ["rust-analyzer"] = {
           cargo = {
               allFeatures = true,
           },
       },
   },
}

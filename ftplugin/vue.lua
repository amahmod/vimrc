if require("utils").check_lsp_client_active "vuels" then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Vue language server configuration (vetur)
require("lspconfig").vuels.setup {
  cmd = {DATA_PATH .. "/lspinstall/vue/node_modules/.bin/vls", "--stdio"},
  on_attach = function(client)
    client.resolved_capabilities.document_formating = false
    require("lsp").common_on_attach(client)
  end,
  root_dir = require("lspconfig").util.root_pattern(".git", "vue.config.js", "package.json", "yarn.lock")
}

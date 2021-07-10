if require("utils").check_lsp_client_active "yamlls" then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- npm install -g yaml-language-server
require("lspconfig").yamlls.setup {
  cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
  on_attach = function(client)
    client.resolved_capabilities.document_formating = false
    require("lsp").common_on_attach(client)
  end
}
vim.cmd "setl ts=2 sw=2 ts=2 ai et"

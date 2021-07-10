if require("utils").check_lsp_client_active "jsonls" then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- npm install -g vscode-json-languageserver
require("lspconfig").jsonls.setup {
  cmd = {
    "node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    "--stdio"
  },
  on_attach = function(client)
    client.resolved_capabilities.document_formating = false
    require("lsp").common_on_attach(client)
  end,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line "$", 0})
      end
    }
  }
}

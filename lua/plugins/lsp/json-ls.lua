-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup {
    on_attach = require'plugins.lsp.functions'.common_on_attach,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

local lspconfig = require('lspconfig')
-- local completion = require('completion')
local map = function(type, key, value)
  vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local on_attach = function(client, buffer)

  print("LSP started.");
  -- completion.on_attach(client, buffer) 

  -- GOTO mappings
  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n','gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('n','gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

  -- ACTION mappings
  map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('n','<leader>aa', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n','<leader>ad', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')

  -- Few language severs support these three
  map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
  map('n','<leader>F',  '<cmd>Prettier<CR>')
  map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

  -- if diagnostic plugin is installed
  map('n','[d','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  map('n',']d','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n','[e','<cmd>lua vim.lsp.diagnostic.goto_prev({ severity = "Error" })<CR>')
  map('n',']e','<cmd>lua vim.lsp.diagnostic.goto_next({ severity = "Error" })<CR>')
  map('n', '<leader>D', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

  map('n','<leader>i', '<cmd>lua vim.lsp.buf.code_action({ source = { organizeImports = true } })<CR>')
  -- vim.api.nvim_command('autocmd CursorHold <buffer> lua vim.lsp.util.show_line_diagnostics()')

end

-- lspconfig.jsonls.setup{
--   on_attach=on_attach
-- }
lspconfig.vuels.setup{
  on_attach=on_attach
}
lspconfig.vimls.setup{
  on_attach = on_attach,
}
lspconfig.tsserver.setup{
  on_attach = on_attach,
}
lspconfig.html.setup{
  on_attach = on_attach,
}

lspconfig.jsonls.setup{
  on_attach = on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
lspconfig.cssls.setup{
  on_attach = on_attach,
  settings = {
    css = {
      validate = false
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}

lspconfig.sumneko_lua.setup{
  on_attach= on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
      completion = { keywordSnippet = "Disable", },
      diagnostics = { enable = true, globals = {
        "vim", "describe", "it", "before_each", "after_each" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        }
      }
    }
  }
}

-- require('lspfuzzy').setup {}

vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler


-- vim.lsp.handlers["textDocument/codeAction"] = require'fzf_lsp'.code_action_handler
-- vim.lsp.handlers["textDocument/definition"] = require'fzf_lsp'.definition_handler
-- vim.lsp.handlers["textDocument/declaration"] = require'fzf_lsp'.declaration_handler
-- vim.lsp.handlers["textDocument/typeDefinition"] = require'fzf_lsp'.type_definition_handler
-- vim.lsp.handlers["textDocument/implementation"] = require'fzf_lsp'.implementation_handler
-- vim.lsp.handlers["textDocument/references"] = require'fzf_lsp'.references_handler
-- vim.lsp.handlers["textDocument/documentSymbol"] = require'fzf_lsp'.document_symbol_handler
-- vim.lsp.handlers["workspace/symbol"] = require'fzf_lsp'.workspace_symbol_handler
-- vim.lsp.handlers["callHierarchy/incomingCalls"] = require'fzf_lsp'.incoming_calls_handler
-- vim.lsp.handlers["callHierarchy/outgoingCalls"] = require'fzf_lsp'.outgoing_calls_handler
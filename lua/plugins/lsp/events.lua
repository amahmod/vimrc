local buf_map = require('modules.util').set_buf_keymap
local M = {}

M.custom_on_attach = function(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
        hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], false)
  end

  if client.resolved_capabilities.document_formatting then
    buf_map("n", "<C-I>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  elseif client.resolved_capabilities.document_range_formatting then
    buf_map("n", "<C-I>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end

  -- go to definition
  buf_map('n', 'gD', ':lua vim.lsp.buf.definition()<CR>')
  -- preview definition
  buf_map('n', 'gd', ':Lspsaga preview_definition<CR>')
  -- show references
  buf_map('n', 'gR', ':Telescope lsp_references<CR>')
  -- show line diagnostic
  buf_map('n', 'gl', ':Lspsaga show_line_diagnostics<CR>')
  -- go to implementation
  buf_map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  -- code action
  buf_map('n', 'ca', ':Telescope lsp_code_actions<CR>')
  buf_map('v', 'ca', ':Lspsaga range_code_action<CR>')
  -- signature help
  buf_map('n', '<C-s>', ':Lspsaga signature_help<CR>')
  -- render hover doc
  buf_map('n', 'K', ':Lspsaga hover_doc<CR>')
  -- rename symbol
  buf_map('n', 'gr', ':Lspsaga rename<CR>')
  -- lsp finder
  buf_map('n', 'gh', ':Lspsaga lsp_finder<CR>')
  -- go to next diagnostic
  buf_map('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>')
  -- go to previous diagnostic
  buf_map('n', ']d', ':Lspsaga diagnostic_jump_next<CR>')
  -- scroll down hover doc or scroll in definition preview
  buf_map('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)')
  -- scroll up hover doc
  buf_map('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)')
end

M.custom_on_init = function(client)
  print("Language Server Protocol started!")
  if client.config.flags then client.config.flags.allow_incremental_sync = true end
end

return M

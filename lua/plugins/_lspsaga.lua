local saga = require 'lspsaga'

local map = function(type, key, value)
  vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end


map("n", 'gh', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', opts)
map("n", '<leader>ca', '<cmd>lua require"lspsaga.codeaction".code_action()<CR>', opts)
map("v", '<leader>ca', '<cmd>lua require"lspsaga.codeaction".range_code_action()<CR>', opts)
map("n", 'K', '<cmd>lua require"lspsaga.hover".render_hover_doc()<CR>', opts)
map("n", '<C-f>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(1)()<CR>', opts)
map("n", '<C-b>', '<cmd>lua require"lspsaga.action".smart_scroll_with_saga(-1)()<CR>', opts)
map("n", 'gs', '<cmd>lua require"lspsaga.signature_help".signature_help()<CR>', opts)
map("n", 'gr', '<cmd>lua require"lspsaga.rename".rename()<CR>', opts)
map("n", 'gd', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
map("n", 'cd', '<cmd>lua require"lspsaga.diagnostic".show_line_diagnostics()<CR>', opts)
map("n", '[d', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', opts)
map("n", ']d', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', opts)
map("n", '<leader>tt', '<cmd>lua require"lspsaga.floaterm".open_float_terminal()<CR>', opts)
-- map("n", '<A-d>', '<cmd>lua require"lspsaga.floaterm".close_float_terminal()<CR>', opts)

  print("LSP started.");
saga.init_lsp_saga()

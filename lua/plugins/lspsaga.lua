local saga = require 'lspsaga'

local map = function(mode, key, value)
  vim.api.nvim_set_keymap(mode,key,value,{noremap = true, silent = true});
end

saga.init_lsp_saga()

map("n", 'gh', ':Lspsaga lsp_finder<CR>', opts)
map("n", '<leader>ca', ':Lspsaga code_action<CR>', opts)
map("v", '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
map("n", 'K', ':Lspsaga hover_doc<CR>', opts)
map("n", '<C-f>', ':lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>', opts)
map("n", '<C-b>', ':lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>', opts)
map("n", 'gs', ':Lspsaga signature_help<CR>', opts)
map("n", 'gr', ':Lspsaga rename<CR>', opts)
map("n", 'gd', ':Lspsaga preview_definition<CR>', opts)
map("n", 'cd', ':Lspsaga show_line_diagnostics<CR>', opts)
map("n", ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
map("n", '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
vim.cmd [[ nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR> ]]
vim.cmd [[ tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR> ]]

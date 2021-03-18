-- TODO figure out why this don't work
vim.fn.sign_define("LspDiagnosticsSignError", {
    texthl = "LspDiagnosticsSignError",
    text = "",
    numhl = "LspDiagnosticsSignError"
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
    texthl = "LspDiagnosticsSignWarning",
    text = "",
    numhl = "LspDiagnosticsSignWarning"
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
    texthl = "LspDiagnosticsSignInformation",
    text = "",
    numhl = "LspDiagnosticsSignInformation"
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
    texthl = "LspDiagnosticsSignHint",
    text = "",
    numhl = "LspDiagnosticsSignHint"
})


vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>')
vim.cmd('nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>')
vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
vim.cmd('nnoremap <silent> ca :Lspsaga code_action<CR>')
vim.cmd('vnoremap <silent> ca :Lspsaga range_code_action<CR>')
vim.cmd('nnoremap <silent> K :Lspsaga hover_doc<CR>')
vim.cmd('nnoremap <silent> [d :Lspsaga diagnostic_jump_prev<CR>')
vim.cmd('nnoremap <silent> ]d :Lspsaga diagnostic_jump_next<CR>')
-- Lspsaga finder
vim.cmd('nnoremap <silent> gh :Lspsaga lsp_finder<CR>')
-- scroll down hover doc or scroll in definition preview
vim.cmd('nnoremap <silent> <C-f> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')
-- scroll up hover doc
vim.cmd('nnoremap <silent> <C-b> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')

-- ranem symbol
vim.cmd('nnoremap <silent> rr :Lspsaga rename<CR>')
-- preview definition
vim.cmd('nnoremap <silent> <leader>gd :Lspsaga preview_definition<CR>')
-- show line diagnostic
vim.cmd('nnoremap <leader>cd :Lspsaga show_line_diagnostics<CR>')
-- Open/Close floating terminal
vim.cmd [[ nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR> ]]
vim.cmd [[ tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR> ]]



require('plugins.lsp.lspkind')
require('plugins.lsp.lightbulb')

require('plugins.lsp.html-ls')
require('plugins.lsp.css-ls')
require('plugins.lsp.js-ls')
require('plugins.lsp.json-ls')
require('plugins.lsp.bash-ls')
require('plugins.lsp.docker-ls')
require('plugins.lsp.lua-ls')
require('plugins.lsp.vim-ls')
require('plugins.lsp.yaml-ls')
require('plugins.lsp.vue-ls')

local strategy = { 'exact', 'substring', 'fuzzy' }

vim.g.completion_enable_auto_popup = 1
vim.g.completion_matching_strategy_list = strategy
vim.g.diagnostic_enable_virtual_text = 1
vim.g.completion_matching_ignore_case = 0
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_auto_change_source = 1

vim.g.completion_chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet', 'tags', 'tabnine' }},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
  },
  string = {
    {complete_items = {'path'}, triggered_only = {'/'}},
  },
  comment = {},
}
vim.cmd('imap  <c-j> <Plug>(completion_next_source)')
vim.cmd('imap  <c-k> <Plug>(completion_prev_source)')
vim.cmd('imap  <c-n> <Plug>(completion_trigger)')

vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")
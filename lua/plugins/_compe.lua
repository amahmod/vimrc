require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local map = function(type, key, value)
  vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

map('i', '<silent><expr> <C-Space>', '<cmd>compe#complete()')
map('i', '<silent><expr> <CR>',     "compe#confirm('<CR>')")
map('i', '<silent><expr> <C-e>',  "compe#close('<C-e>')")
map('i', '<silent><expr> <C-f>',     "compe#scroll({ 'delta': +4 })")
map('i', '<silent><expr> <C-d>',     "compe#scroll({ 'delta': -4 })")

print('HI THERE')
  print("LSP started.");

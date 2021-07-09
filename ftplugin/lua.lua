if not require("utils").check_lsp_client_active "sumneko_lua" then
  require('lsp.lua')
  print('require lsp.lua')
end
print('ftdetect lua')
if O.lang.lua.autoformat then
  require("utils").define_augroups {
    _lua_autoformat = {{"BufWritePre", "*.lua", "lua vim.lsp.buf.formatting_sync(nil, 1000)"}}
  }
end

vim.cmd "setl ts=2 sw=2"

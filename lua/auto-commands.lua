local augroup = require('utils').define_augroups

augroup {
  highlight_yank = {{"TextYankPost", [[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]]}},
  auto_format = {
    {"BufWritePre", "*.js", "lua vim.lsp.buf.formatting_sync(nil,1000)"},
    {"BufWritePre", "*.vue", "lua vim.lsp.buf.formatting_sync(nil,1000)"},
    {"BufWritePre", "*.html", "lua vim.lsp.buf.formatting_sync(nil,1000)"},
    {"BufWritePre", "*.json", "lua vim.lsp.buf.formatting_sync(nil,1000)"},
    {"BufWritePre", "*.lua", "lua vim.lsp.buf.formatting_sync(nil,1000)"}
  },
  filetypes = {
    {"FileType", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"},
    {"BufNewFile,BufRead", ".eslintrc", "setf json"}, {"BufNewFile,BufRead", ".eslintignore", "setf gitignore"},
    -- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
    {"BufWritePost", "plugins.lua", "PackerCompile"}, {"FileType", "gitcommit", "set spell"}
  }
}

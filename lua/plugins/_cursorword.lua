local autocmd = require "autocmd"

local cursorword = {
  autocmd = {
    {"FileType", "defx,denite,fern,clap,vista", "let b:cursorword = 0"};
    {"WinEnter","*","if &diff || &pvw | let b:cursorword = 0 | endif"};
    {"InsertEnter", "*", "let b:cursorword = 0"};
    {"InsertLeave", "*","let b:cursorword = 1"};
  }
}

autocmd.nvim_create_augroups(cursorword)
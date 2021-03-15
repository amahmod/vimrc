local global = require("globals")
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")



local global_local = {
  termguicolors  = true;
  mouse          = "nv";
  hidden         = true;
  encoding       = "utf-8";
  clipboard      = "unnamedplus";
  wildignorecase = true;
  wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";
  backup         = false;
  writebackup    = false;
  undofile       = true;
  swapfile       = false;
  directory      = global.cache_dir .. "swag/";
  undodir        = global.cache_dir .. "undo/";
  backupdir      = global.cache_dir .. "backup/";
  viewdir        = global.cache_dir .. "view/";
  spellfile      = global.cache_dir .. "spell/en.uft-8.add";
  history        = 2000;
  backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
  history        = 2000;
  ignorecase     = true;
  smartcase      = true;
  startofline    = false;
  splitbelow     = false;
  splitright     = true;
  completeopt    = "menuone,noselect";
  scrolloff      = 2;
}

local bw_local   = {
  textwidth      = 80;
  expandtab      = true;
  autoindent     = true;
  tabstop        = 2;
  shiftwidth     = 2;
  softtabstop    = -1;
  wrap           = false;
  number         = true;
  colorcolumn    = "200";
  foldenable     = true;
  signcolumn     = "yes:2";
  conceallevel   = 2;
  concealcursor  = "niv";
}


-- bind options
function bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      vim.api.nvim_command('set ' .. k)
    else
      vim.api.nvim_command('set ' .. k .. '=' .. v)
    end
  end
end


for name, value in pairs(global_local) do
  vim.o[name] = value
end
bind_option(bw_local)


-- Map <leader> to space
vim.g.mapleader = " "

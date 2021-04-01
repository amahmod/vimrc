_G.Util = {}

local fn = vim.fn
local home = os.getenv("HOME")
local user = os.getenv("USER")
local path_sep = Util.is_windows and '\\' or '/'
local os_name = vim.loop.os_uname().sysname

Util.is_mac = os_name == 'Darwin'
Util.is_linux = os_name == 'Linux'
Util.is_windows = os_name == 'Windows'
Util.vim_path = home .. path_sep .. '.config' .. path_sep .. 'nvim'
Util.cache_dir = home .. path_sep .. '.cache' .. path_sep .. 'vim' .. path_sep
Util.modules_dir = Util.vim_path .. path_sep .. 'modules'
Util.path_sep = path_sep
Util.home = home
Util.os_name = os_name
Util.user = user

Util.set_keymap = function(mode, key, value, options)
  options = options or {noremap = true, silent = true}
  vim.api.nvim_set_keymap(mode, key, value, options)
end

Util.set_buf_keymap = function(mode, key, value, options)
  options = options or {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, mode, key, value, options)
end

Util.is_cfg_present = function(cfg_name)
  -- this returns 1 if it's not present and 0 if it's present
  -- we need to compare it with 1 because both 0 and 1 is `true` in lua
  return fn.empty(fn.glob(vim.loop.cwd() .. cfg_name)) ~= 1
end

return Util

require "default-config"
require "options"
require "plugins"
require "keybindings"

vim.g.colors_name = O.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.

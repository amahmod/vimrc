require "default-config"
require "options"
require "plugins"

vim.g.colors_name = O.colorscheme -- Colorscheme must get called after plugins are loaded or it will break new installs.

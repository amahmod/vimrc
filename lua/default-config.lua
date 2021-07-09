CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"
HOME = vim.fn.expand "$HOME"

-- Global options
O = {
	  transparent_window = false,
	  number = true,
	  relative_number = true,
          clipboard = "unnamedplus",
	  colorscheme = "zephyr",
}

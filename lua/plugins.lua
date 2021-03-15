local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end



-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    -- " Themes
    use 'gruvbox-community/gruvbox'
    use 'glepnir/zephyr-nvim'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    use { 'glepnir/galaxyline.nvim', branch = 'main', config = 'require("plugins.galaxyline")', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use { 'romgrk/barbar.nvim' }

    -- Explorer
    use { 'kyazdani42/nvim-tree.lua', config = 'require("plugins.nvim-tree")' }
    
    -- Color highlight
    use { 'norcalli/nvim-colorizer.lua', config='require("plugins.nvim-colorizer")' }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim'}, config = 'require("plugins.telescope")' }

  end,
  config = {
      display = {
          open_fn = require"packer.util".float
      }
  }
})

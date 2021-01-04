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


    -- " colorschemes
    -- use 'numtostr/gruvbox-material'
    use 'glepnir/zephyr-nvim'

    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}
      },
      config = 'require("plugins._treesitter")',
      event = "VimEnter *"
    }

    use 'kyazdani42/nvim-web-devicons'
    use { 'akinsho/nvim-bufferline.lua',
      config = function()
        require'bufferline'.setup{
          options = {
            modified_icon = '✥',
            buffer_close_icon = '',
            mappings = true,
            always_show_bufferline = false,
          };
        }
      end
    }
    use {'kyazdani42/nvim-tree.lua', config = 'require("plugins._nvim-tree")'}
    use { 'glepnir/galaxyline.nvim', config = 'require("plugins._statusline")' }

    use {'norcalli/nvim-colorizer.lua', config='require("plugins._colorizer")'}
    use {'rhysd/accelerated-jk',}

    use { 'itchyny/vim-cursorword', event = 'BufReadPre,BufNewFile *', config = 'require("plugins._cursorword")' }

    use {
      'airblade/vim-gitgutter',
      config = 'require("plugins._gitgutter")'
    }

  end,
  config = {
      display = {
          open_fn = require"packer.util".float
      }
  }
})
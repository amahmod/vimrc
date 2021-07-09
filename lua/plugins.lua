---@diagnostic disable: undefined-global
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup({
  function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    --  " Themes
    use 'gruvbox-community/gruvbox'
    use 'glepnir/zephyr-nvim'

    --  Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {"neovim/nvim-lspconfig"}
    use {
      "kabouzeid/nvim-lspinstall",
      event = "VimEnter",
      config = function()
        require("lspinstall").setup()
      end
    }

  end,
  config = {display = {open_fn = require"packer.util".float}}
})

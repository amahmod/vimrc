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

    -- Nvim-tree
    use {'kyazdani42/nvim-tree.lua', config = 'require("plugins.nvim-tree").config()'}

    -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {
      "nvim-telescope/telescope.nvim",
      config = [[require('plugins.telescope')]]
      -- event = "BufEnter",
    }

    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      after = {"telescope.nvim"},
      config = [[require('plugins.autopairs')]]
    }

    -- Treesitter   use {
    use {'nvim-treesitter/nvim-treesitter', config = 'require("plugins.treesitter")', run = ':TSUpdate'}

    -- Pretty parentheses
    use {"p00f/nvim-ts-rainbow", disable = not O.plugin.ts_rainbow.active}

    -- Autotags <div>|</div>
    use {"windwp/nvim-ts-autotag", event = "InsertEnter", disable = not O.plugin.ts_autotag.active}

    -- Custom semantic text objects
    use {"nvim-treesitter/nvim-treesitter-textobjects", disable = not O.plugin.ts_textobjects.active}

    -- Smart text objects
    use {"RRethy/nvim-treesitter-textsubjects", disable = not O.plugin.ts_textsubjects.active}

    -- Text objects using hint labels
    use {"mfussenegger/nvim-ts-hint-textobject", event = "BufRead", disable = not O.plugin.ts_hintobjects.active}

    -- LSP
    use {"neovim/nvim-lspconfig"}
    use {
      "kabouzeid/nvim-lspinstall",
      event = "VimEnter",
      config = function()
        require("lspinstall").setup()
      end
    }

    -- Git
    use {'airblade/vim-gitgutter', config = 'require("plugins.gitgutter")'}
    use 'tpope/vim-fugitive'

  end,
  config = {display = {open_fn = require"packer.util".float}}
})

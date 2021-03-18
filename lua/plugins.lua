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

    --  " Themes
    use 'gruvbox-community/gruvbox'
    use 'glepnir/zephyr-nvim'

    --  Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    --  Status Line and Bufferline
    use { 'glepnir/galaxyline.nvim', branch = 'main', config = 'require("plugins.galaxyline")', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use { 'akinsho/nvim-bufferline.lua', config = 'require("plugins.nvim-bufferline")' }

    --  Explorer
    use { 'kyazdani42/nvim-tree.lua', config = 'require("plugins.nvim-tree")' }

    --  Color highlight
    use { 'norcalli/nvim-colorizer.lua', config='require("plugins.nvim-colorizer")' }

    --  Git
    use { 'airblade/vim-gitgutter', config = 'require("plugins.gitgutter")' }
    use 'tpope/vim-fugitive'
    use { 'mattn/vim-gist', requires = { 'mattn/webapi-vim' } }

    --  Autocomplete
    use { 'hrsh7th/nvim-compe', config = 'require("plugins.compe")' }
    use { 'hrsh7th/vim-vsnip', requires = { 'hrsh7th/vim-vsnip-integ', after = 'vim-vsnip'}, config = function() vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets" end }

    --  Syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', requires = { {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'}, }, config = 'require("plugins.treesitter")'}

    --  Telescope
    use { 'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim'}, config = 'require("plugins.telescope")' }

    --  LSP
    use { 'neovim/nvim-lspconfig', requires = { 'onsails/lspkind-nvim',  'kosayoda/nvim-lightbulb' }, config = 'require("plugins.lsp")'  }
    use { 'glepnir/lspsaga.nvim', config = 'require("plugins.lspsaga")' }

    --  Javascript
    use { 'metakirby5/codi.vim' }
    use { 'heavenshell/vim-jsdoc', ft = {'javascript', 'typescript', 'vue' }, run = 'make install' }

    --  Markdown
    use { 'iamcco/markdown-preview.nvim', run =  'cd app && yarn install', config = function() vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]] end }

    --  Code formatting
    use { 'prettier/vim-prettier', ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html' }, run = 'yarn install' }


    -- General Plugins
    use 'vimwiki/vimwiki'
    use { 'liuchengxu/vista.vim',     config =  'require("plugins.vista")'  }
    use { 'windwp/nvim-autopairs',    config = 'require("plugins.nvim-autopairs")' }
    use { 'b3nj5m1n/kommentary',      config = 'require("plugins.kommentary")' }
    use { 'alvan/vim-closetag',       config = 'require("plugins.closeatag")' }
    use { 'phaazon/hop.nvim',         config = 'require("plugins.hop")' }
    use { 'AndrewRadev/tagalong.vim', config = 'require("plugins.tagalong")'}
    use { 'glacambre/firenvim',       run = function() vim.fn['firenvim#install'](1) end }
    use 'glepnir/indent-guides.nvim'
    use 'rhysd/accelerated-jk'
    use 'tpope/vim-surround'
    use 'junegunn/vim-easy-align'
    use { 'christoomey/vim-tmux-navigator'}
  end,
  config = {
      display = {
          open_fn = require"packer.util".float
      }
  }
})

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
    use 'gruvbox-community/gruvbox'
    use 'glepnir/zephyr-nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'glepnir/indent-guides.nvim'
    use 'rhysd/accelerated-jk' 
    use { 'glepnir/galaxyline.nvim', config = 'require("plugins._statusline")' }
    use { 'itchyny/vim-cursorword', event = 'BufReadPre,BufNewFile *', config = 'require("plugins._cursorword")' }
    use { 'tpope/vim-repeat', 'jiangmiao/auto-pairs', 'tpope/vim-surround', 'junegunn/vim-easy-align', 'tpope/vim-commentary' }
    use {'norcalli/nvim-colorizer.lua', config='require("plugins._colorizer")'}

    use { 
      'easymotion/vim-easymotion',
      config = function()
        vim.g.EasyMotion_do_mapping       = 0
        vim.g.EasyMotion_prompt           = 'Jump to → '
        vim.g.EasyMotion_keys             = 'fjdkswbeoavn'
        vim.g.EasyMotion_smartcase        = 1
        vim.g.EasyMotion_use_smartsign_us = 1
      end
    }
    -- Version control
    use { 'airblade/vim-gitgutter', config = 'require("plugins._gitgutter")' }
    use  'tpope/vim-fugitive'
    use { 'mattn/vim-gist', requires = {'/mattn/webapi-vim'} }
    -- Code formatting
    use { 'prettier/vim-prettier', ft = { 'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html' }, run = 'yarn install' }
    -- Tools
    use 'christoomey/vim-tmux-navigator'
    use 'vimwiki/vimwiki'
    use 'mbbill/undotree'
    use 'wakatime/vim-wakatime'
    use { 
      'liuchengxu/vista.vim',
      config = function()
        vim.api.nvim_set_var('vista#renderer#enable_icon',  1)
        vim.g.vista_disable_statusline   = 1
        vim.g.vista_default_executive    = 'ctags'
        vim.g.vista_echo_cursor_strategy = 'floating_win'
        vim.g.vista_vimwiki_executive    = 'markdown'
        vim.g.vista_executive_for = {
          vimwiki         = 'markdown',
          pandoc          = 'markdown',
          markdown        = 'toc',
          typescript      = 'nvim_lsp',
          typescriptreact = 'nvim_lsp',
        }
      end
    }
    use {
      'hrsh7th/vim-vsnip',
      requires = { 'hrsh7th/vim-vsnip-integ', after = 'vim-vsnip'},
      config = function()
        vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"
      end
    }
    use {'kyazdani42/nvim-tree.lua', config = 'require("plugins._nvim-tree")'}
    use { 'akinsho/nvim-bufferline.lua',
      config = function()
        require'bufferline'.setup{
          options = {
            modified_icon = '✥',
            buffer_close_icon = '',
            mappings = true,
            always_show_bufferline = true,
          };
        }
      end
    }
    -- Fuzzy finder
    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}, config = 'require("plugins._telescope")' }
    -- Syntax highlighting
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
        { 'nvim-treesitter/completion-treesitter', after = 'nvim-treesitter' }
      },
      config = 'require("plugins._treesitter")',
      event = "VimEnter *"
    }
    -- Markdown
    use {
      'iamcco/markdown-preview.nvim',
      run =  'cd app && yarn install',
      config = function()
        vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]]
      end
    }
    -- Javascript
    use { 'metakirby5/codi.vim' }
    use { 'heavenshell/vim-jsdoc', ft = {'javascript', 'typescript', 'vue' }, run = 'make install' }
    -- LSP
    use { 'neovim/nvim-lspconfig', config = 'require("plugins._lsp")' }
    use { 'glepnir/lspsaga.nvim', config = 'require("plugins._lspsaga")' }

    -- Completion

    -- LSP / Completion
    
    -- use {'RishabhRD/popfix', 'RishabhRD/nvim-lsputils'}
    -- use {
    --   'nvim-lua/completion-nvim',
    --   requires = {
    --     {'steelsojka/completion-buffers', after = 'completion-nvim'},
    --     -- {'aca/completion-tabnine', run =  './install.sh'},
    --     {'kristijanhusak/completion-tags', after = 'completion-nvim'},
    --   },
    --   config = 'require("plugins._completion")'
    -- }
    -- use { 'ojroques/nvim-lspfuzzy' }
  end,
  config = {
      display = {
          open_fn = require"packer.util".float
      }
  }
})

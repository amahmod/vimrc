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
    use {'norcalli/nvim-colorizer.lua', config = 'require("modules.nvim-colorizer")'} -- highlight color

    --  Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    --  Status Line and Bufferline
    use {'glepnir/galaxyline.nvim', branch = 'main', config = 'require("modules.galaxyline")'}
    use {'akinsho/nvim-bufferline.lua', config = 'require("modules.nvim-bufferline")'}

    --  Explorer
    use {'kyazdani42/nvim-tree.lua', config = 'require("modules.nvim-tree")'}

    --  Git
    use {'airblade/vim-gitgutter', config = 'require("modules.gitgutter")'}
    use {'f-person/git-blame.nvim', config = 'require("modules.git-blame")'}
    use 'tpope/vim-fugitive'

    -- Easily create gists
    use {'mattn/vim-gist', requires = {'mattn/webapi-vim'}}

    --  Completion
    use {'hrsh7th/nvim-compe', config = 'require("modules.compe")'}
    use {'windwp/nvim-autopairs', config = 'require("modules.nvim-autopairs")'}
    use {
      'hrsh7th/vim-vsnip',
      requires = {'hrsh7th/vim-vsnip-integ', after = 'vim-vsnip'},
      config = function()
        vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"
      end
    }
    use 'xabikos/vscode-javascript'
    use 'ChristianChiarulli/html-snippets'
    use 'sdras/vue-vscode-snippets'
    use {'mattn/emmet-vim', config = 'require("modules.emmet")'}

    --  Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'JoosepAlviste/nvim-ts-context-commentstring', 'windwp/nvim-ts-autotag', 'p00f/nvim-ts-rainbow',
        {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
        {'nvim-treesitter/nvim-treesitter-refactor', after = "nvim-treesitter"}
      },
      config = 'require("modules.treesitter")',
      run = ':TSUpdate'
    }
    use {'lukas-reineke/indent-blankline.nvim', config = 'require("modules.indent-blankline")'}

    --  Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-media-files.nvim'},
      config = 'require("modules.telescope")'
    }

    --  LSP
    use {
      'neovim/nvim-lspconfig',
      requires = {'onsails/lspkind-nvim', 'kosayoda/nvim-lightbulb', 'glepnir/lspsaga.nvim'},
      config = 'require("lsp")'
    }

    --  Javascript
    use {'metakirby5/codi.vim'}
    use {'heavenshell/vim-jsdoc', ft = {'javascript', 'typescript', 'vue'}, run = 'make install'}

    --  Markdown
    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      config = function()
        vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]]
      end
    }

    -- Quick navigation
    use {'phaazon/hop.nvim'}
    use {'unblevable/quick-scope', config = 'require("modules.quick-scope")'} -- hop may replace you
    use {'christoomey/vim-tmux-navigator'}

    -- General Plugins
    use 'rhysd/accelerated-jk'
    use 'junegunn/vim-easy-align'
    use 'tpope/vim-surround'
    use {'vimwiki/vimwiki', branch = 'dev', config = 'require("modules.vimwiki")'}
    use {'liuchengxu/vista.vim', config = 'require("modules.vista")'}
    use {'terrortylor/nvim-comment', config = 'require("modules.nvim-comment")'}
    use 'moll/vim-bbye'
    use {'MattesGroeger/vim-bookmarks', config = 'require("modules.vim-bookmarks")'}
    use {'liuchengxu/vim-which-key', config = 'vim.cmd [[ source ~/.config/nvim/lua/modules/whichkey.vim ]]'}
  end,
  config = {display = {open_fn = require"packer.util".float}}
})

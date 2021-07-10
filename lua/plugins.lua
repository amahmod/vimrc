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

    -- Autocomplete
    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
        require("plugins.compe")
      end,
      disable = not O.plugin.compe.active
    }

    -- Snippet
    use {"hrsh7th/vim-vsnip", event = "InsertEnter"}
    use {"rafamadriz/friendly-snippets", event = "InsertEnter"}

    -- Comments
    use {
      "terrortylor/nvim-comment",
      event = "BufWinEnter",
      config = function()
        require('nvim_comment').setup()
      end
    }

    -- comments in context
    use {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufRead",
      disable = not O.plugin.ts_context_commentstring.active
    }

    -- Status Line and Bufferline
    use {
      "glepnir/galaxyline.nvim",
      config = function()
        require "plugins.galaxyline"
      end
      -- event = "VimEnter",
    }
    use {'akinsho/nvim-bufferline.lua', event = "BufWinEnter", config = 'require("plugins.bufferline")'}

    -- Indentation
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = 'require("plugins.indent-blankline")',
      event = "BufRead",
      branch = 'lua'
    }

    -- Colorize colro codes
    use {'norcalli/nvim-colorizer.lua', config = 'require("plugins.colorizer")'}

    -- Document javascript code
    use {'heavenshell/vim-jsdoc', ft = {'javascript', 'typescript', 'vue'}, run = 'make install'}

    --  Markdown
    use {
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn install',
      config = function()
        vim.cmd [[ let g:mkdp_filetypes = ['markdown', 'vimwiki'] ]]
      end
    }

    -- Close buffer without messing up the window layout
    use {'moll/vim-bbye'}

    -- Align texts easily
    use 'junegunn/vim-easy-align'

    -- Accelerate up-down moving by j and k
    use 'rhysd/accelerated-jk'

    -- Easily manage surroundings in pairs
    use 'tpope/vim-surround'

    -- Jump anywhere in the document
    use {'phaazon/hop.nvim'}

    -- Quick jump anywhere in the line
    use {
      'unblevable/quick-scope',
      config = function()
        vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
        vim.g.qs_max_chars = 150
      end
    }

    -- Easy movement between vim,tmux splits
    use {'christoomey/vim-tmux-navigator'}

  end,
  config = {display = {open_fn = require"packer.util".float}}
})

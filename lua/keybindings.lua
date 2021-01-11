local pbind = require('plbind')
local map_cr = pbind.map_cr
local map_cu = pbind.map_cu
local map_cmd = pbind.map_cmd
local map_args = pbind.map_args
local vim = vim

local mapping = setmetatable({}, { __index = { vim = {},plugin = {} } })

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

function mapping:load_vim_define()
  self.vim= {
    -- Vim map
    ["n|<leader>rv"] = map_cr('source $MYVIMRC'):with_silent(),
    ["n|<leader>s"]  = map_cr('w'):with_silent(),
    ["n|<leader>x"]  = map_cr('bw'):with_silent(),
    ["n|<leader>wq"] = map_cr('wq!'):with_silent(),
    ["n|<leader>q"]  = map_cr('q!'):with_silent(),
    ["n|Y"]          = map_cmd('y$'),
    ["n|gp"]         = map_cmd('`[v`]'),
    ["n|<leader>tl"] = map_cr('exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"'),
    ["n|<leader>bo"] = map_cr('w <bar> %bd <bar> e# <bar> bd#'):with_noremap(),
    ["n|<leader>ba"] = map_cr('bufdo bd'):with_noremap(),
    ["n|<leader>ws"] = map_cu('sp'),
    ["n|<leader>wv"] = map_cu('vs'),
    ["n|<leader>wH"] = map_cmd('<C-w>H'),
    ["n|<leader>wJ"] = map_cmd('<C-w>J'),
    ["n|<leader>wK"] = map_cmd('<C-w>K'),
    ["n|<leader>wL"] = map_cmd('<C-w>L'),
    ["n|<leader>wx"] = map_cmd('<C-w>x'),
    ["n|<leader>wc"] = map_cmd('<C-w>c'),
    ["n|<leader>wo"] = map_cmd('<C-w>o'),
    ["n|<leader>wR"] = map_cmd('<C-w>R'),
    ["n|]b"]         = map_cu('bp'):with_noremap(),
    ["n|[b"]         = map_cu('bn'):with_noremap(),
    ["n|]w"]         = map_cu('WhitespaceNext'):with_noremap(),
    ["n|[w"]         = map_cu('WhitespacePrev'):with_noremap(),
    ["n|<C-w>["]     = map_cr('vertical resize -5'),
    ["n|<C-w>]"]     = map_cr('vertical resize +5'),
    ["n|<Leader>S"]  = map_cu('SessionSave'):with_noremap(),
    ["n|<Leader>Sl"] = map_cu('SessionLoad'):with_noremap(),
    ["n|<CR>"]       = map_cr('nohlsearch'):with_silent(),
    -- command line
    ["c|<C-b>"]      = map_cmd('<Left>'):with_noremap(),
    ["c|<C-f>"]      = map_cmd('<Right>'):with_noremap(),
    ["c|<C-p>"]      = map_cmd('<Down>'):with_noremap(),
    ["c|<C-n>"]      = map_cmd('<Up>'):with_noremap(),
    ["c|<C-a>"]      = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"]      = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"]      = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"]      = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"]      = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap()
  };
end

function mapping:load_plugin_define()
  self.plugin = {
    -- Plugn gitgutter
    ["n|]g"]                = map_cmd('<plug>(GitGutterNextHunk)'),
    ["n|[g"]                = map_cmd('<plug>(GitGutterPrevHunk)'),
    ["n|<leader>hf"]        = map_cr('GitGutterFold'):with_noremap(),
    -- Plugin nvim-tree
    ["n|<Leader>e"]         = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>F"]         = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
    -- Plugin acceleratedjk
    ["n|j"]                 = map_cmd('<Plug>(accelerated_jk_gj)'):with_silent(),
    ["n|k"]                 = map_cmd('<Plug>(accelerated_jk_gk)'):with_silent(),
    -- Plugin easymotion
    ["n|<leader><leader>f"] = map_cmd('<Plug>(easymotion-ovewin-f)'):with_silent(),
    ["n|<leader><leader>l"] = map_cmd('<Plug>(easymotion-overwin-line)'):with_silent(),
    ["n|<leader><leader>w"] = map_cmd('<Plug>(easymotion-bd-w)'):with_silent(),
    -- Plugin fugitive
    ["n|<leader>ga"]        = map_cr('Git add %:p'):with_silent(),
    ["n|<leader>gg"]        = map_cr('Git'):with_silent(),
    ["n|<leader>gc"]        = map_cr('Git commit'):with_silent(),
    ["n|<leader>gd"]        = map_cr('Gdiffsplit'):with_silent(),
    ["n|<leader>ge"]        = map_cr('Gedit'):with_silent(),
    ["n|<leader>gr"]        = map_cr('Gread'):with_silent(),
    ["n|<leader>gw"]        = map_cr('Gwrite'):with_silent(),
    ["n|<leader>gB"]        = map_cr('Git blame'):with_silent(),
    ["n|<leader>gb"]        = map_cr('Git branch'):with_silent(),
    ["n|<leader>gf"]        = map_cr('Gfetch'):with_silent(),
    ["n|<leader>gl"]        = map_cr('Git log'):with_silent(),
    -- Plugin vista
    ["n|<leader>to"]        = map_cr('Vista!!'):with_silent(),
    ["n|<leader>fo"]        = map_cr('Vista finder fzf'):with_silent(),
    -- Plugin fzf.vim
    ["n|<C-p>"]             = map_cr('Files'):with_silent(),
    ["n|<leader>ff"]        = map_cr('GFiles'):with_silent(),
    ["n|<leader>fc"]        = map_cr('Commands'):with_silent(),
    ["n|<leader>fh"]        = map_cr('History'):with_silent(),
    ["n|<leader>f:"]        = map_cr('History:'):with_silent(),
    ["n|<leader>f/"]        = map_cr('History/'):with_silent(),
    ["n|<leader>fm"]        = map_cr('Marks'):with_silent(),
    ["n|<leader>tc"]        = map_cr('Colors'):with_silent(),
    ["n|<leader>fb"]        = map_cr('Buffers'):with_silent(),
    ["n|<leader>fl"]        = map_cr('BLines'):with_silent(),
    ["n|<leader>fC"]        = map_cr('Commits'):with_silent(),
    ["n|<leader>fw"]        = map_cr('LinesWithPreview'):with_silent(),
    ["i|<C-x><C-k>"]        = map_cmd('<Plug>(fzf-complete-word)'):with_silent(),
    ["i|<C-x><C-f>"]        = map_cmd('<Plug>(fzf-complete-path)'):with_silent(),
    ["i|<C-x><C-j>"]        = map_cmd('<Plug>(fzf-complete-file-rg)'):with_silent(),
    ["i|<C-x><C-l>"]        = map_cmd('<Plug>(fzf-complete-line)'):with_silent(),
    -- Plugin undotree
    ["n|<leader>tu"]        = map_cr('UndotreeToggle'):with_noremap():with_silent(),
    -- Plugin prettier
    ["n|<leader>F"]         = map_cr('Prettier'):with_noremap():with_silent(),
    -- Plugin easyalign
    ["x|ga"]                = map_cmd('<Plug>(EasyAlign)'):with_silent(),
    ["n|ga"]                = map_cmd('<Plug>(EasyAlign)'):with_silent(),
    -- Plugin vim-vsnip
    ["s|<TAB>"]             = map_cmd([[pumvisible() ? "\<C-n>" : vsnip#available(1) ?"\<Plug>(vsnip-expand-or-jump)" : v:lua.check_back_space() ? "\<TAB>" : completion#trigger_completion()]]):with_expr():with_silent(),
    ["i|<TAB>"]             = map_cmd([[pumvisible() ? "\<C-n>" : vsnip#available(1) ?"\<Plug>(vsnip-expand-or-jump)" : v:lua.check_back_space() ? "\<TAB>" : completion#trigger_completion()]]):with_expr():with_silent(),
    -- Plugin vim-jsdoc
    ["n|<leader>d"]         = map_cmd('<Plug>(jsdoc)'):with_silent(),
  };
end


local function load_mapping()
  mapping:load_vim_define()
  mapping:load_plugin_define()
  pbind.nvim_load_mapping(mapping.vim)
  pbind.nvim_load_mapping(mapping.plugin)
end

load_mapping()

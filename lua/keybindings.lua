local map = require('utils').set_keymap

vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- General Keybindings
map('n', '<leader>s', ':w<CR>')
map('n', '<leader>wq', ':wq!<CR>')
map('n', '<leader>q', ':q!<CR>')
map('n', 'Y', 'y$<CR>')
map('n', '<leader>gp', '`[v`]<CR>')
map('n', '<leader>bo', ':w <bar> %bd <bar> e# <bar> bd#<CR>')
map('n', '<leader>ba', ':bufdo bd<CR>')

-- split window
map('n', '<leader>ws', ':sp<CR>')
map('n', '<leader>wv', ':vs<CR>')

-- better window movement
map("n", "<leader>wH", '<C-w>H')
map("n", "<leader>wJ", '<C-w>J')
map("n", "<leader>wK", '<C-w>K')
map("n", "<leader>wL", '<C-w>L')
map("n", "<leader>wx", '<C-w>x')
map("n", "<leader>wc", '<C-w>c')
map("n", "<leader>wo", '<C-w>o')
map("n", "<leader>wR", '<C-w>R')

-- navigate through buffers
map("n", "]b", ':bp<CR>')
map("n", "[b", ':bn<CR>')

-- resize with arrows
map("n", "<C-Right>", ':vertical resize -2<CR>')
map("n", "<C-Left>", ':vertical resize +2<CR>')
map("n", "<C-Up>", ':resize -2<CR>')
map("n", "<C-Down>", ':resize +2<CR>')

-- hide search highlight
map("n", "<leader>th", ':nohlsearch<CR>')

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- switch to normal mode by jj,jk,kj
map("i", "jj", '<esc>')
map("i", "jk", '<esc>')
map("i", "kj", '<esc>')

-- Toggle line numbers
map('n', '<leader>tn', ':set nonumber!<CR>')
-- Toggle relative line numbers
map('n', '<leader>tr', ':set norelativenumber!<CR>')

-- Quickfix
map('n', '<leader>ax', ':cclose<CR>')
map('n', '<leader>aj', ':cnext<CR>')
map('n', '<leader>ak', ':cprevious<CR>')

-- Better nav for omnicomplete
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

------------------------------------
--  PLUGIN SPECIFIC KEYBINDINGS
------------------------------------

-- Nvim Bufferline
map('n', '<leader>bn', ':BufferLineCycleNext<CR>')
map('n', '<leader>bp', ':BufferLineCyclePrev<CR>')
map('n', '<leader>be', ':BufferLineSortByExtension<CR>')
map('n', '<leader>bd', ':BufferLineSortByDirectory<CR>')
map('n', '<leader>bb', ':BufferLinePick<CR>')

-- vim.bbye
map('n', '<leader>x', ':Bdelete<CR>')

-- Nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')
map('n', '<leader>?', ':NvimTreeFindFile<CR>')

--  Gitgutter
map('n', '<leader>gj', ':GitGutterNextHunk<CR>')
map('n', '<leader>gk', ':GitGutterPrevHunk<CR>')
map('n', '<leader>gf', ':GitGutterFold<CR>')
map('n', '<leader>gh', ':GitGutterLineHighlightsToggle<CR>')
map('n', '<leader>gs', ':GitGutterStageHunk<CR>')
map('n', '<leader>gu', ':GitGutterUndoHunk<CR>')
map('n', '<leader>gp', ':GitGutterPreviewHunk<CR>')

-- Accelerated_jk
vim.api.nvim_set_keymap("n", "j", '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap("n", "k", '<Plug>(accelerated_jk_gk)', {})

-- Fugitive
map("n", "<leader>gg", ':Git<CR>')
map("n", "<leader>gd", ':Git diff<CR>')
map("n", "<leader>gD", ':Gdiffsplit<CR>')
map("n", "<leader>ge", ':Gedit<CR>')
map("n", "<leader>gr", ':Gread<CR>')
map("n", "<leader>gw", ':Gwrite<CR>')
map("n", "<leader>gB", ':Git blame<Cr>')
map("n", "<leader>gl", ':Git log<CR>')

-- Git blame
map('n', '<leader>tb', ':GitBlameToggle<CR>')

-- Vim gists
map('n', '<leader>Gb', ':Gist -b') -- post gist browser
map('n', '<leader>Gd', ':Gist -d') -- delete gist
map('n', '<leader>Ge', ':Gist -e') -- edit gist
map('n', '<leader>Gl', ':Gist -l') -- list public gist
map('n', '<leader>Gs', ':Gist -ls') -- list started gist
map('n', '<leader>Gm', ':Gist -ls') -- post gist all buffers
map('n', '<leader>GP', ':Gist -P') --  post public gist
map('n', '<leader>Gp', ':Gist -p') -- post private gist

-- Hop
map('n', 's', ":HopChar2<cr>")
map('n', 'S', ":HopWord<cr>")

-- Vista
map('n', '<leader>to', ':Vista!!<CR>')
map('n', '<leader>fo', ':Vista finder fzf')

-- Prettier
map('n', '<leader>F', ':Prettier<CR>')

-- EasiAlign
map('n', 'ga', ':EasyAlign<CR>')
map('v', 'ga', ':EasyAlign<CR>')
map('x', 'ga', ':EasyAlign<CR>')

-- JsDoc
map("n", "<leader>ad", ':JsDoc<CR>')

-- Lspsaga
-- Open/Close floating terminal
vim.cmd [[ nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR> ]]
vim.cmd [[ tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR> ]]

-- Markdown Preview
map('n', '<leader>tm', ':MarkdownPreviewToggle<CR>')

-- Nvim colorizer
map('n', '<leader>tc', ':ColorizerToggle<CR>')

-- Indent blankline
map('n', '<leader>ti', ':IndentBlanklineToggle<CR>')

-- Codi
map('n', '<leader>ac', ':Codi<CR>')
map('n', '<leader>aC', ':Codi!<CR>')

-- Vim bookmarks
map('n', '<leader>mm', ':BookmarkToggle<CR>')
map('n', '<leader>mi', ':BookmarkAnnotate')
map('n', '<leader>mn', ':BookmarkNext<CR>')
map('n', '<leader>mp', ':BookmarkPrev<CR>')
map('n', '<leader>ma', ':BookmarkShowAll<CR>')
map('n', '<leader>mc', ':BookmarkClear<CR>')
map('n', '<leader>mx', ':BookmarkClearAll<CR>')

-- Emmet
vim.cmd [[ imap <expr> <C-e> emmet#expandAbbrIntelligent("\<C-e>") ]]

-- Compe
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- LSP
-- go to definition
map('n', 'gD', ':lua vim.lsp.buf.definition()<CR>')
-- preview definition
map('n', 'gd', ':Lspsaga preview_definition<CR>')
-- show references
map('n', 'gR', ':Telescope lsp_references<CR>')
-- show line diagnostic
map('n', 'gl', ':Lspsaga show_line_diagnostics<CR>')
-- go to implementation
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
-- code action
map('n', 'ca', ':Telescope lsp_code_actions<CR>')
map('v', 'ca', ':Lspsaga range_code_action<CR>')
-- signature help
map('n', '<C-s>', ':Lspsaga signature_help<CR>')
-- render hover doc
map('n', 'K', ':Lspsaga hover_doc<CR>')
-- rename symbol
map('n', 'gr', ':Lspsaga rename<CR>')
-- lsp finder
map('n', 'gh', ':Lspsaga lsp_finder<CR>')
-- go to next diagnostic
map('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>')
-- go to previous diagnostic
map('n', ']d', ':Lspsaga diagnostic_jump_next<CR>')
-- scroll down hover doc or scroll in definition preview
map('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)')
-- scroll up hover doc
map('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)')
map('n', '<C-I>', ':lua vim.lsp.buf.formatting()<CR>')

-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>')
map('n', '<leader>.', ':Telescope filetypes<CR>')
map('n', '<leader>fa', ':Telescope lsp_code_actions<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>b?', ':Telescope buffers<CR>')
map('n', '<leader>fB', ':Telescope git_branches<CR>')
map('n', '<leader>fc', ':Telescope commands<CR>')
map('n', '<leader>fC', ':Telescope git_commits<CR>')
map('n', '<leader>fd', ':Telescope lsp_document_diagnostics<CR>')
map('n', '<leader>fD', ':Telescope lsp_workspace_diagnostics<CR>')
map('n', '<leader>ff', ':Telescope git_files<CR>')
map('n', '<leader>fh:', ':Telescope command_history<CR>')
map('n', '<leader>fi:', ':Telescope medai_files<CR>')
map('n', '<leader>fm:', ':Telescope marks<CR>')
map('n', '<leader>fM:', ':Telescope man_pages<CR>')
map('n', '<leader>fo', ':Telescope oldfiles<CR>')
map('n', '<leader>fq', ':Telescope quickfix<CR>')
map('n', '<leader>fr:', ':Telescope registers<CR>')
map('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>fS', ':Telescope lsp_workspace_symbols<CR>')
map('n', '<leader>fw:', ':Telescope live_grep<CR>')
map('n', '<leader>fW', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>')
map('n', '<leader>fl', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>fu', ':Telescope colorscheme<CR>')


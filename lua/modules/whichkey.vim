" Timeout
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

let g:which_key_map =  {}
let g:which_key_sep = '→'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['1'] = 'buffer 1'
let g:which_key_map['2'] = 'buffer 2'
let g:which_key_map['3'] = 'buffer 3'
let g:which_key_map['4'] = 'buffer 4'
let g:which_key_map['5'] = 'buffer 5'
let g:which_key_map['6'] = 'buffer 6'
let g:which_key_map['7'] = 'buffer 7'
let g:which_key_map['8'] = 'buffer 8'
let g:which_key_map['9'] = 'buffer 9'

let g:which_key_map[','] = [ '<Plug>(emmet-expand-abbr)'                       , 'expand tags' ]
let g:which_key_map['?'] = [ ':NvimTreeFindFile'                               , 'find current file' ]
let g:which_key_map['e'] = [ ':NvimTreeToggle'                                 , 'explorer' ]
let g:which_key_map['q'] = [ ':q!'                                 , 'close window' ]
" let g:which_key_map['w'] = [ ':w'                                 , 'save buffer' ]
" let g:which_key_map['wq'] = [ ':wq'                                 , 'save and close' ]


" -----------------------------
" Emmet
" -----------------------------
let g:which_key_map['.'] = {
      \ 'name' : '+emmet' ,
      \ ',' : ['<Plug>(emmet-expand-abbr)'               , 'expand abbr'],
      \ ';' : ['<plug>(emmet-expand-word)'               , 'expand word'],
      \ 'u' : ['<plug>(emmet-update-tag)'                , 'update tag'],
      \ 'd' : ['<plug>(emmet-balance-tag-inward)'        , 'balance tag in'],
      \ 'D' : ['<plug>(emmet-balance-tag-outward)'       , 'balance tag out'],
      \ 'n' : ['<plug>(emmet-move-next)'                 , 'move next'],
      \ 'N' : ['<plug>(emmet-move-prev)'                 , 'move prev'],
      \ 'i' : ['<plug>(emmet-image-size)'                , 'image size'],
      \ '/' : ['<plug>(emmet-toggle-comment)'            , 'toggle comment'],
      \ 'j' : ['<plug>(emmet-split-join-tag)'            , 'split join tag'],
      \ 'k' : ['<plug>(emmet-remove-tag)'                , 'remove tag'],
      \ 'a' : ['<plug>(emmet-anchorize-url)'             , 'anchorize url'],
      \ 'A' : ['<plug>(emmet-anchorize-summary)'         , 'anchorize summary'],
      \ 'm' : ['<plug>(emmet-merge-lines)'               , 'merge lines'],
      \ 'c' : ['<plug>(emmet-code-pretty)'               , 'code pretty'],
      \ }


" -----------------------------
" Actions
" -----------------------------
let g:which_key_map.a = {
      \ 'name' : '+actions',
      \ 'c' : [':Codi',      'virtual repl off'],
      \ 'C' : [':Codi!',     'virtual repl off'],
      \ 'd' : [':JsDoc',     'JsDoc'],
      \ 'x' : [':cclose',    'close quickfix'],
      \ 'j' : [':cnext',     'next quickfix item'],
      \ 'k' : [':cprevious', 'previous quickfix item'],
      \ }


" -----------------------------
" Toggle
" -----------------------------
let g:which_key_map.t = {
      \ 'name' : '+toggle',
      \ 'h' : [':nohlsearch',            'remove search highlight'],
      \ 'i' : [':IndentBlan lineToggle', 'toggle indent lines'],
      \ 'n' : [':set nonumber!',         'line-numbers'],
      \ 'r' : [':set norelativenumber!', 'relative line nums'],
      \ 'v' : [':Vista!!',               'outline toggle'],
      \ 'm' : [':MarkdownPreviewToggle', 'preview markdown'],
      \ 'c' : [':ColorizerToggle',       'toggle colorizer'],
      \ }

" -----------------------------
" Buffer
" -----------------------------
let g:which_key_map.b = {
      \ 'name' : '+buffer',
      \ 'n' : [':BufferLineCycleNext',       'next buffer'],
      \ 'p' : [':BufferLineCyclePrev',       'prev buffer'],
      \ 'b' : [':BufferLinePick',            'pick buffer'],
      \ 'e' : [':BufferLineSortByExtension', 'sort by extension'],
      \ 'd' : [':BufferLineSortByDirectory', 'sort by directory'],
      \ '?' : [':Telescope buffers',         'buffer list'],
      \ }

" -----------------------------
" Marks
" -----------------------------
let g:which_key_map.m = {
    \ 'name': '+marks',
    \ 'm' : [':BookmarkToggle',   'toggle'],
    \ 'i' : [':BookmarkAnnotate', 'annotate a mark'],
    \ 'n' : [':BookmarkNext',     'next mark'],
    \ 'p' : [':BookmarkPrev',     'prev mark'],
    \ 'a' : [':BookMarkShowAll',  'show all marks'],
    \ 'c' : [':BookmakrClear',    'remove a mark'],
    \ 'x' : [':BookmarkClearAll', 'remove all marks']
    \ }



" -----------------------------
" Find
" -----------------------------
let g:which_key_map.f = {
      \ 'name' : '+find',
      \ '.' : [':Telescope filetypes',                 'filetypes'],
      \ 'a' : [':Telescope lsp_code_actions',          'code actions'],
      \ 'b' : [':Telescope buffers',                   'buffers'],
      \ 'B' : [':Telescope git_branches',              'git branches'],
      \ 'c' : [':Telescope commands',                  'commands'],
      \ 'C' : [':Telescope git_commits',               'git commits'],
      \ 'd' : [':Telescope lsp_document_diagnostics',  'document_diagnostics'],
      \ 'D' : [':Telescope lsp_workspace_diagnostics', 'workspace_diagnostics'],
      \ 'f' : [':Telescope git_files',                 'git files'],
      \ 'h' : [':Telescope command_history',           'history'],
      \ 'i' : [':Telescope media_files',               'media files'],
      \ 'l' : [':Telescope fuzzy_find',                'find in current buffer'],
      \ 'm' : [':Telescope marks',                     'marks'],
      \ 'M' : [':Telescope man_pages',                 'man_pages'],
      \ 'o' : [':Telescope oldfiles',                  'oldfiles'],
      \ 'q' : [':Telescope quickfix',                  'quickfix'],
      \ 'r' : [':Telescope registers',                 'registers'],
      \ 's' : [':Telescope lsp_document_symbols',      'document symbols'],
      \ 'S' : [':Telescope lsp_workspace_symbols',     'workspace symbols'],
      \ 'u' : [':Telescope colorscheme',               'colorschemes'],
      \ 'v' : [':Vista finder fzf',                    'find symbols from vista'],
      \ 'w' : [':Telescope live_grep',                 'search text'],
      \ 'W' : [':Telescope live_grep',                 'search word under cursor'],
      \ }


" -----------------------------
" Git
" -----------------------------
let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 'b' : [':GitBlameToggle',       'blame'],
      \ 'B' : [':Git blame',            'blame'],
      \ 'd' : [':Git diff',             'diff'],
      \ 'D' : [':Gdiffsplit',           'diff staged'],
      \ 'j' : [':GitGutterNextHunk',    'next hunk'],
      \ 'k' : [':GitGutterPrevHunk',    'prev hunk'],
      \ 's' : [':GitGutterStageHunk',   'stage hunk'],
      \ 'u' : [':GitGutterUndoHunk',    'undo stage hunk'],
      \ 'p' : [':GitGutterPreviewHunk', 'preview hunk'],
      \ 'f' : [':GitGutterFold',        'fold hunk'],
      \ 'g' : [':Git',                  'status'],
      \ 'r' : [':Gread',                'checkout'],
      \ 'w' : [':Gwrite',               'Gwrite'],
      \ 'e' : [':Gedit',                'Gedit'],
      \ 'l' : [':Git log',              'git log']
      \ }


" -----------------------------
" Gist
" -----------------------------
let g:which_key_map.G = {
      \ 'name' : '+gist' ,
      \ 'b' : [':Gist -b'                          , 'post gist browser'],
      \ 'd' : [':Gist -d'                          , 'delete gist'],
      \ 'e' : [':Gist -e'                          , 'edit gist'],
      \ 'l' : [':Gist -l'                          , 'list public gists'],
      \ 's' : [':Gist -ls'                         , 'list starred gists'],
      \ 'm' : [':Gist -m'                          , 'post gist all buffers'],
      \ 'p' : [':Gist -P'                          , 'post public gist '],
      \ 'P' : [':Gist -p'                          , 'post private gist '],
      \ }

" -----------------------------
" LSP
" -----------------------------
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ 'a' : [':Lspsaga code_action'                , 'code action'],
      \ 'A' : [':Lspsaga range_code_action'          , 'selected action'],
      \ 'd' : [':Telescope lsp_document_diagnostics' , 'document diagnostics'],
      \ 'D' : [':Telescope lsp_workspace_diagnostics', 'workspace diagnostics'],
      \ 'f' : [':LspFormatting'                      , 'format'],
      \ 'I' : [':LspInfo'                            , 'lsp info'],
      \ 'v' : [':LspVirtualTextToggle'               , 'lsp toggle virtual text'],
      \ 'l' : [':Lspsaga lsp_finder'                 , 'lsp finder'],
      \ 'L' : [':Lspsaga show_line_diagnostics'      , 'line_diagnostics'],
      \ 'p' : [':Lspsaga preview_definition'         , 'preview definition'],
      \ 'q' : [':Telescope quickfix'                 , 'quickfix'],
      \ 'r' : [':Lspsaga rename'                     , 'rename'],
      \ 'T' : [':LspTypeDefinition'                  , 'type defintion'],
      \ 's' : [':Telescope lsp_document_symbols'     , 'document symbols'],
      \ 'S' : [':Telescope lsp_workspace_symbols'    , 'workspace symbols'],
      \ }



" let g:which_key_map.d = {
"       \ 'name' : '+debug' ,
"       \ 'b' : ['DebugToggleBreakpoint '        , 'toggle breakpoint'],
"       \ 'c' : ['DebugContinue'                 , 'continue'],
"       \ 'i' : ['DebugStepInto'                 , 'step into'],
"       \ 'o' : ['DebugStepOver'                 , 'step over'],
"       \ 'r' : ['DebugToggleRepl'               , 'toggle repl'],
"       \ 's' : ['DebugStart'                    , 'start'],
"       \ }
      " \ 'O' : ['DebugStepOut'                  , 'next-buffer'],
      " \ 'S' : ['DebugGetSession '              , 'fzf-buffer'],

" let g:which_key_map.R = {
"       \ 'name' : '+Find_Replace' ,
"       \ 'f' : [':Farr --source=vimgrep'    , 'file'],
"       \ 'p' : [':Farr --source=rgnvim'     , 'project'],
"       \ }


call which_key#register('<Space>', "g:which_key_map")

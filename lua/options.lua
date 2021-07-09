local cmd = vim.cmd
local opt = vim.opt


---  VIM ONLY COMMANDS  ---

cmd "filetype plugin on"
cmd('let &titleold="' .. TERMINAL .. '"')
cmd "set inccommand=split"
cmd "set iskeyword+=-"
cmd "set whichwrap+=<,>,[,],h,l"
if O.transparent_window then
    cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
    cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
end


opt.clipboard = O.clipboard -- allows neovim to access the system clipboard
opt.number = O.number -- set numbered lines
opt.relativenumber = O.relative_number -- set relative numbered lines
opt.termguicolors = true -- set term gui colors (most terminals support this)

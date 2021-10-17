local cmd = vim.cmd
local opt = vim.opt
local has = vim.fn.has

cmd('filetype plugin indent on')
cmd('syntax enable')

-- systematic
opt.encoding = 'utf-8'
opt.fileencodings = { 'utf-8' }
opt.backup = false -- no .bak
opt.swapfile = false -- no .swap
opt.undofile = true -- use undo file
opt.updatetime = 300 -- time (in ms) to write to swap file

-- buffer
opt.tabstop = 2           -- " number of spaces a tab counts for
opt.shiftwidth = 2        -- " spaces of autoindents
opt.expandtab = true      -- " turn a tab into spaces
opt.smarttab = true       -- " smart tabl handling for indenting
opt.smartindent = true    -- " smart auto indent
opt.ruler = true          -- " show the cursor position
opt.number = true         -- " show line number
opt.relativenumber = true -- " use relative number
opt.cursorline = true     -- " highlight current line
opt.laststatus = 2        -- " always show status line

-- editing
opt.whichwrap = 'b,s,<,>,[,]' -- cursor is able to move from end of line to next line
opt.backspace = { 'indent', 'eol', 'start' } -- backspace behaviors
opt.list = true -- show tabs with listchars
opt.listchars= {
  extends = '❯',
  precedes = '❮',
  trail = '·',
  tab = '▸ ',
  eol = '¬'
}
opt.showbreak = '↪'
opt.hlsearch = true -- highlight search
opt.incsearch = true -- no incremental search
opt.ignorecase = true -- search with no ignore case
opt.smartcase = true -- search with smart case
opt.inccommand = 'nosplit' -- live substitute preview
opt.completeopt = { 'menuone', 'noselect' }
-- opt.completeopt=menu,menuone,preview,noselect,noinsert

opt.colorcolumn = { 120 } -- display a color column when line is longer than 120 chars
opt.signcolumn = 'yes' -- show sign column (column of the line number)
opt.mouse = 'nv' -- enable mouse under normal and visual mode

cmd('set mousehide') -- hide mouse when characters are typed

opt.showmatch = true -- show bracket match
opt.cmdheight = 2 -- height of :command line
opt.wildmenu = true -- wildmenu, auto complete for commands
opt.wildmode = { 'longest', 'full' }
opt.splitright = true -- split to right
opt.splitbelow = true -- split to below
opt.shortmess:append('c') -- status line e.g. CTRL+G

-- " solve performance issue with iterm2
opt.ttyfast=true
opt.lazyredraw=true

if not has('gui_running') then
  opt.t_Co = 256
end

if has('termguicolors') then
  cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
  opt.termguicolors = true
end

local autocmds = {
  autonopaste = {
    -- Leave paste mode when leaving insert mode
    { 'InsertLeave', '*', 'set nopaste' },
  },
}
require('nvim_utils')
nvim_create_augroups(autocmds)

-- TODOs
-- folder
-- trim_white_space
-- wildignore
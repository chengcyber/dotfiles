vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true     -- highlight current line

-- buffer
vim.opt.tabstop = 2           -- " number of spaces a tab counts for
vim.opt.shiftwidth = 2        -- " spaces of autoindents
vim.opt.expandtab = true      -- " turn a tab into spaces
vim.opt.smarttab = true       -- " smart tabl handling for indenting
vim.opt.smartindent = true    -- " smart auto indent
vim.opt.softtabstop = 2

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- editing
vim.opt.whichwrap = 'b,s,<,>,[,]' -- cursor is able to move from end of line to next line
vim.opt.backspace = { 'indent', 'eol', 'start' } -- backspace behaviors
vim.opt.list = true -- show tabs with listchars
vim.opt.listchars= {
  extends = '❯',
  precedes = '❮',
  trail = '·',
  tab = '▸ ',
  -- eol = '¬'
}
vim.opt.showbreak = '↪'
vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = true -- no incremental search
vim.opt.ignorecase = true -- search with no ignore case
vim.opt.smartcase = true -- search with smart case
vim.opt.inccommand = 'nosplit' -- live substitute preview
vim.opt.completeopt = { 'menuone', 'noselect' }
-- opt.completeopt=menu,menuone,preview,noselect,noinsert
vim.opt.colorcolumn = { 120 } -- display a color column when line is longer than 120 chars
vim.opt.signcolumn = 'yes' -- show sign column (column of the line number)
-- vim.opt.mouse = 'nv' -- enable mouse under normal and visual mode

vim.opt.showmatch = true -- show bracket match
vim.opt.cmdheight = 2 -- height of :command line

-- " solve performance issue with iterm2
vim.opt.ttyfast=true
vim.opt.lazyredraw=true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

local has = vim.fn.has

if not has('gui_running') then
  vim.opt.t_Co = 256
end

if has('termguicolors') then
  vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
  vim.opt.termguicolors = true
end

-- autocmd
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*.json", command = "set filetype=jsonc" }
)


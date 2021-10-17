local vimp = require('vimp')
local nnoremap = vimp.nnoremap
local inoremap = vimp.inoremap
local vnoremap = vimp.vnoremap

vim.g.mapleader = ' '

nnoremap('<leader>ev', ':vsplit $MYVIMRC<cr>')
nnoremap('<leader>sv', function()
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('config.X') is called
  -- it will reload the file
  require("config.util").unload_lua_namespace('config')
  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  dofile(vim.fn.stdpath('config') .. '/init.lua')

  print("Reloaded vimrc!")
end)

nnoremap('<leader>-', ':Explore<cr>')

-- add a blank line above
nnoremap('<leader>O', 'O<esc>j')

-- split window
nnoremap('<leader>S', ':split<cr>')
nnoremap('<leader>V', ':vsplit<cr>')

-- navigation between windows
nnoremap('<leader>wj', '<C-w>j')
nnoremap('<leader>wk', '<C-w>k')
nnoremap('<leader>wh', '<C-w>h')
nnoremap('<leader>wl', '<C-w>l')

-- traverse change list
nnoremap('g;', 'g;zz')
nnoremap('g,', 'g,zz')

-- keep search matches in the middle of the window
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')

-- tab
nnoremap('<leader>T', ':tabnew<cr>')
nnoremap('<leader>K', ':tabclose<cr>')
nnoremap('<leader>N', ':tabnext<cr>')
nnoremap('<leader>P', ':tabprevious<cr>')

-- quickfix
nnoremap('<c-q>', ':copen<cr>')

-- copies relative path of current file
nnoremap('<leader>cs', ':let @*=expand("%")<CR>')
-- copies full path of current file
nnoremap('<leader>cl', ':let @*=expand("%:p")<CR>')

-- emacs way to save
nnoremap('<c-x><c-s>', ':w')

-- copy till line end
-- nnoremap('Y', 'y$')

-- copy till line end to system clipboard
nnoremap('gy', '"+y')

-- -- copy whole file to system clipboard
nnoremap('gY', 'gg"+yG')
nnoremap('gp', '"+p')

-- behave like shell
inoremap('<c-a>', '<Home>')
inoremap('<c-e>', '<End>')

-- prevent entring ex mode accidentally
nnoremap('Q', '<nop>')

-- Tab/shift-tab to indent/outdent in visual mode.
vnoremap('<Tab>', '>gv')
vnoremap('<S-Tab>', '<g')

-- Search for the selected text
vnoremap('*', 'xy/<C-R>x<CR>')

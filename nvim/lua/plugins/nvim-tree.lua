local vimp = require('vimp')
local nnoremap = vimp.nnoremap

require('nvim-tree').setup({
  disable_netrw = false,
  hijack_netrw = false,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    side = 'right',
    auto_resize = true,
  },
})

nnoremap('<leader>op', ':NvimTreeToggle<CR>')

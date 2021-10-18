local try_require = require('common').try_require
-- bootstrap packer.nvim
try_require('config.bootstrap')

try_require('config.options')
try_require('config.keymaps')

try_require('plugins.telescope')
try_require('plugins.lspconfig')
try_require('plugins.cmp')
try_require('plugins.treesitter')
try_require('plugins.lightline')
try_require('plugins.nord')
try_require('plugins.nvim-tree')
try_require('plugins.toggleterm')

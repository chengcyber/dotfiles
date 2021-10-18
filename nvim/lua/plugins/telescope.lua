local vimp = require('vimp')

local nnoremap = vimp.nnoremap

nnoremap('<leader><leader>', ':Telescope find_files find_command=fd,--hidden,--exclude,*.git,--type,f<cr>')
nnoremap('<leader>ff', ':Telescope find_files find_command=fd,--no-ignore,--hidden,--exclude,*.git,--type,f<cr>')
nnoremap('<leader>fg', ':Telescope git_files<cr>')
nnoremap('<leader>fs', ':Telescope live_grep<cr>')
nnoremap('<leader>ft', ':Telescope help_tags<cr>')
nnoremap('<leader>fk', ':Telescope keymaps<cr>')

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

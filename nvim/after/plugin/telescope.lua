local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', function() 
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    builtin.git_files({
      show_untracked = true,
      -- recurse_submodules = false,
      -- entry_maker =
      -- git_command =
      --
    })
  else
    builtin.find_files({
      hidden = true,
      no_ignore = false,
      no_ignore_parent = false,
      follow = true,
      -- search_file = 
      -- search_dirs =
    })
  end
end, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pa', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pt', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pk', builtin.keymaps, {})

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-h>"] = actions.which_key,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    }
})

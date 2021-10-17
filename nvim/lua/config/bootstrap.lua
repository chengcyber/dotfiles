local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'svermeulen/vimpeccable'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'norcalli/nvim_utils'

  use 'nvim-telescope/telescope.nvim'
  use 'itchyny/lightline.vim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      -- require('nvim-tree').setup({})
    end
  }
  use({
    'nvim-treesitter/nvim-treesitter', -- treesitter
    run = ':TSUpdate',
  })

  -- theme
  use 'shaunsingh/nord.nvim'

  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'

  use 'justinmk/vim-sneak'

  -- language support
  use 'neovim/nvim-lspconfig'

  -- completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-emoji'
  use 'f3fora/cmp-spell'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
})

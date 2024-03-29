# Environment

macOS Sierra 10.12.1
Linux Ubuntu 18.04

# Installation

```
git clone git@github.com:kimochg/dotfiles.git ~/dotfiles && cd ~/dotfiles/setup && chmod a+x setup.sh && ./setup.sh
```

## Manually Install Tmux

```
mkdir -p ~/.tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s -f `pwd`/tmux.conf ~/.tmux.conf
ln -s -f `pwd`/tmux.conf.local ~/.tmux.conf.local
```

1. run tmux
2. Press prefix + I (capital i, as in Install) to fetch the plugin.

# Amazing Addons

- [Rg](https://github.com/BurntSushi/ripgrep)
- [Ag](https://github.com/ggreer/the_silver_searcher)
- [facebook pathpicker](https://facebook.github.io/PathPicker/)

# Setup

1. open `tmux`, use `CTRL + A, I` install plugins
2. open `macvim`, use `:PluginInstall`

# Caveats

Remember `tmux kill-server`, which totally reset your tmux config.

# Vim

## Plugins

### Essential

- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
- [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
- [JazzCore/ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher)
- [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
- [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)

### Productivity

- [haya14busa/incsearch.vim](https://github.com/haya14busa/incsearch.vim)
- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
- [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
- [godlygeek/tabular](https://github.com/godlygeek/tabular)
- [jreybert/vimagit](https://github.com/jreybert/vimagit)
- [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim)
- [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
- [honza/vim-snippets](https://github.com/honza/vim-snippets)
- [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)

### Syntax

- [leafgarland/typescript-vim](https://github.com/leafgarland/typescript-vim)
- [reasonml-editor/vim-reason](https://github.com/reasonml-editor/vim-reason)

### UI

- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [morhetz/gruvbox](https://github.com/morhetz/gruvbox)

# Tmux

## Prerequisite

### Mac

```
brew install reattach-to-user-namespace
```

### Ubuntu

```
sudo apt-get install xclip # or xsel
```

## Plugins

- [TPM](https://github.com/tmux-plugins/tpm)
- [Tmux sensible](https://github.com/tmux-plugins/tmux-sensible)
- [Tmux continuum](https://github.com/tmux-plugins/tmux-continuum)

## Theme

- [tmux-onedark-theme](https://github.com/odedlaz/tmux-onedark-theme)

## Other

- [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)

# Resources

- [colbycheeze/dotfiles](https://github.com/colbycheeze/dotfiles)
- [jcxia43/dotfiles](https://github.com/jcxia43/dotfiles)
- [gpakosz/.tmux](https://github.com/gpakosz/.tmux)
- [jonhoo/configs](https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim)
- [crispgm/dotfiles](https://github.com/crispgm/dotfiles)

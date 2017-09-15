#!/bin/sh

# handle folder links
# TODO: Currently these will nest if a link exists, so add check # http://stackoverflow.com/questions/5767062/how-to-check-if-symlink-exists
# fancy_echo "Symlinking dotfiles"
# ln -s ~/dotfiles/zsh ~/.zsh
# ln -s ~/dotfiles/bin ~/.bin
# ln -s ~/dotfiles/aliases ~/.aliases
# ln -s ~/dotfiles/agignore ~/.agignore
# ln -s ~/dotfiles/gitconfig ~/.gitconfig
# ln -s ~/dotfiles/gitmessage ~/.gitmessage
# ln -s ~/dotfiles/gvimrc ~/.gvimrc
# ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
# ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim
# ln -s ~/.vim ~/.config/nvimrc
# ln -s ~/dotfiles/vimrc.bundles ~/.vimrc.bundles
# ln -s ~/dotfiles/zshenv ~/.zshenv
# ln -s ~/dotfiles/zshrc ~/.zshrc

source ~/dotfiles/setup/functions.sh

dotfiles=(
tmux.conf
vimrc
ctags
)

fancy_echo "Backup current config"
today=`date +%Y%m%d`
# for i in ; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
# for i in $HOME/.vim $HOME/.vimrc; do [ -L $i ] && unlink $i ; done
for i in ${dotfiles[@]} ;
do
  [ -e ~/.$i ] && [ ! -L ~/.$i ] && mv ~/.$i ~/.$i.bak.$today ;
  [ -L ~/.$i ] && unlink ~/.$i ;
done

fancy_echo "Symlinking dotfiles"
for i in ${dotfiles[@]} ;
do
  ln -s ~/dotfiles/$i ~/.$i
done

fancy_echo "Setting up temp folds"
if [[ ! -e ~/.vim/tmp/backup ]]; then
  mkdir -p ~/.vim/tmp/backup
  echo "backup created..."
fi
if [[ ! -e ~/.vim/tmp/swap ]]; then
  mkdir -p ~/.vim/tmp/swap
  echo "swap created..."
fi
if [[ ! -e ~/.vim/tmp/undo ]]; then
  mkdir -p ~/.vim/tmp/undo
  echo "undo created..."
fi

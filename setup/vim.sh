#!/bin/bash

# set up vim plugins

source ~/dotfiles/setup/functions.sh

fancy_echo "Install Vim Plugins"
vim -c 'PluginInstall' -c 'qa!'

echo "begin compile plugins"
echo "======= ctrlp-cmathcer ======="
echo "https://github.com/JazzCore/ctrlp-cmatcher"
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
$HOME/.vim/bundle/ctrlp-cmatcher/install.sh

echo "====== YouCompleteMe ======"
echo "https://github.com/Valloric/YouCompleteMe"
if [ `which npm` ]
then
  sudo npm install -g typescript
fi
python $HOME/.vim/bundle/YouCompleteMe/install.py --tern-completer


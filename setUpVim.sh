#!/bin/bash

sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get install -y vim exuberant-ctags python3-pip vim
pip3 install --user pynvim
pip3 install --user neovim


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./vimrc ~/.vimrc
vim +PluginInstall +qall

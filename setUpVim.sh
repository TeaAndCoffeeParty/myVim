#!/bin/bash

sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get install -y vim exuberant-ctags python3-pip vim
pip3 install --user pynvim
pip3 install --user neovim

if [ -d "$HOME/.vim/bundle/Vundle.vim" ];then 
	echo "~/.vim/bundle/Vundle.vim has exists"
else
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp ./vimrc ~/.vimrc
sed -i "s|/home/Tuo|$(echo $HOME)|g" ~/.vimrc

vim +PluginInstall +qall

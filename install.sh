#!/bin/sh
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm ~/.vimrc ~/.tmux.conf
ln -s ~/vimrc/.vimrc ~/.vimrc
vim +PluginInstall! +qa
ln -s ~/vimrc/.tmux.conf ~/.tmux.conf

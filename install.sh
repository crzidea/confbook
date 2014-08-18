#!/bin/sh
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
rm ~/.vimrc ~/.tmux.conf
ln -s ~/vimrc/.vimrc ~/.vimrc
vim +BundleInstall! +qa
ln -s ~/vimrc/.tmux.conf ~/.tmux.conf

#!/bin/sh
rm ~/.vimrc ~/.tmux.conf
ln -s ~/vimrc/.vimrc ~/.vimrc
vim +BundleInstall! +qa
ln -s ~/vimrc/.tmux.conf ~/.tmux.conf

#!/bin/sh
work_dir=`dirname $0`
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm ~/.vimrc ~/.tmux.conf
ln -s ~/$work_dir/.vimrc ~/.vimrc
vim +VundleInstall! +qa
ln -s ~/$work_dir/.tmux.conf ~/.tmux.conf

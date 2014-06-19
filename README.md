vimrc
=====

My vimrc with vundle (and SublimeText settings. But you will say goodbye to ST after using this .vimrc.).

I am using it with gvim on Windows and vim on Linux.

## Install

```bash
wget https://raw.github.com/crzidea/vimrc/master/.vimrc -O ~/.vimrc --no-check-certificate
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
wget https://raw.github.com/crzidea/vimrc/master/.editorconfig -O ~/.vim/.editorconfig --no-check-certificate
vim +BundleInstall +qall
```

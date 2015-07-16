confbook
========

My vimrc with vundle (and SublimeText settings. But you will say goodbye to ST after using this .vimrc.).

I am using it with gvim on Windows and vim on Linux.

There is something not need in this repo, for example:: `.bash_profile`, `.gitconfig`, etc.
Just FYI.

## Install

```bash
git clone https://github.com/crzidea/confbook.git ~/confbook
```

### bash

Insert below to your ~/.vimrc

```
source ~/confbook/.bash_profile
```

### vim

- Install Vundle:
    ```
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```
- Insert below to your ~/.vimrc
    ```
    source ~/confbook/.vimrc
    ```

### tmux

Insert below to your ~/.vimrc

```
source-file ~/confbook/.tmux.conf
```

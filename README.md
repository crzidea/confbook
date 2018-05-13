confbook
========

My vimrc with vundle (and SublimeText settings. But you will say goodbye to ST after using this .vimrc.).

I am using it with gvim on Windows and vim on Linux.

There is something not need in this repo, for example:: `.bash_profile`, `.gitconfig`, etc.
Just FYI.

## Install

```bash
git clone https://github.com/crzidea/confbook.git ~/.confbook && ~/.confbook/install
```

### bash

Insert below to your ~/.bash_profile

```
source ~/.confbook/.bash_profile
```

### vim

- Insert below to your ~/.vimrc

    ```
    source ~/.confbook/.vimrc
    ```

- Install Vundle and plugins:

    ```
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall! +qall
    ```

### editorconfig

Link to your ~/.editorconfig

```
ln -s ~/.confbook/.editorconfig ~/.editorconfig
```

### tmux

Insert below to your ~/.tmux.conf

```
source-file ~/.confbook/.tmux.conf
```

### ssh

Link to your ~/.ssh/config

```
ln -s ~/.confbook/ssh_config ~/.ssh/config
```

### git

Link to your /etc/gitconfig

```
sudo ln -s ~/.confbook/gitconfig /etc/gitconfig
```

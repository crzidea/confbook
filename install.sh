#!/usr/bin/env bash
CONFBOOK_DIR=$(cd `dirname $0`; pwd)
function insert_line() {
  file=$1
  line=$2
  touch $file
  grep "$line" $file >/dev/null
  if [[ 1 -eq $? ]]; then
    echo $line
    echo $line >>$file
  else
    echo "skip $line"
  fi
}
insert_line ~/.bashrc       "source $CONFBOOK_DIR/.bash_profile"
insert_line ~/.vimrc        "source $CONFBOOK_DIR/.vimrc"
insert_line ~/.tmux.conf    "source-file $CONFBOOK_DIR/.tmux.conf"
insert_line ~/.tmux.conf    "source-file $CONFBOOK_DIR/.tmux-v1.9.conf"

     ln -s $CONFBOOK_DIR/.editorconfig  ~/
     ln -s $CONFBOOK_DIR/.openssl.cnf   ~/
     ln -s $CONFBOOK_DIR/ssh_config     ~/.ssh/config
sudo ln -s $CONFBOOK_DIR/gitconfig      /etc/gitconfig

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall! +qall

#!/usr/bin/env bash
set -x

CONFBOOK_DIR=$(cd `dirname $0`; pwd)
function insert_line() {
  file=$1
  line=$2
  touch $file
  grep "$line" $file >/dev/null
  if [[ 1 -eq $? ]]; then
    echo $line >>$file
  else
    echo "skip $line"
  fi
}

# Configurations in $HOME
insert_line ~/.bashrc     "source $CONFBOOK_DIR/.bash_profile"
insert_line ~/.vimrc      "source $CONFBOOK_DIR/.vimrc"
insert_line ~/.tmux.conf  "source-file $CONFBOOK_DIR/.tmux.conf"
insert_line ~/.tmux.conf  "source-file $CONFBOOK_DIR/.tmux-v1.9.conf"

ln -s $CONFBOOK_DIR/.editorconfig ~/
ln -s $CONFBOOK_DIR/.openssl.cnf  ~/
ln -s $CONFBOOK_DIR/ssh_config    ~/.ssh/config

function clone_or_fetch() {
  url=$1
  dir=$2
  if [[ -d $dir ]]; then
    cd $dir
    git fetch origin
  else
    git clone $url $dir
    cd $dir
  fi
  git checkout HEAD
}

# Install Vundle
clone_or_fetch https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall! +qall

# Useful tools
mkdir -p ~/.local
clone_or_fetch https://github.com/crzidea/local-bin.git ~/.local-bin

# Add sudoer
#insert_line /etc/sudoers.d/$USER "${USER} ALL=(ALL) NOPASSWD:ALL" sudo
echo "${USER} ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER

sudo cp -f $CONFBOOK_DIR/gitconfig /etc/gitconfig

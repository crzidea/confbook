# .bash_profile

# Get the aliases and functions
if [ -f ./.bashrc ]; then
	. ./.bashrc
fi

# User specific environment and startup programs

export LANG=en_US.UTF-8
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export CLICOLOR=1
export EDITOR=vim
alias ll='ls -l'

[ -z $TMUX ] && tmux attach

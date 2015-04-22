# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
DEBUG=mit-api:*,-mit-api:clients
EDITOR=vim

export PATH DEBUG EDITOR

[ -z $TMUX ] && tmux attach

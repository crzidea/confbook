# .bash_profile

# User specific environment and startup programs
export LANG=en_US.UTF-8
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export CLICOLOR=1
export EDITOR=vim
alias ll='ls -l'
alias hostip='ping -c 1 `hostname` | head -n 1 | grep -Eo "([0-9]+\.){3}[0-9]+"'

[ -z $TMUX ] && tmux attach

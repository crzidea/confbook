# .bash_profile

# User specific environment and startup programs
export LANG=en_US.UTF-8
export CLICOLOR=1
export EDITOR=vim
alias ll='ls -l'
alias hostip='ping -c 1 `hostname` | head -n 1 | grep -Eo "([0-9]+\.){3}[0-9]+"'

# Add PATHs
for bin in /data/applications/*/bin ; do
  PATH=$bin:$PATH
done
PATH=./node_modules/.bin:$HOME/.local/bin:$HOME/bin:$PATH
export PATH

[ -z $TMUX ] && tmux attach

# Optimize NVM loading
node --version >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

ssh-add >/dev/null 2>&1

# .bash_profile

if [[ -n "$TMUX" && -z "$TMUX_NEED_SOURCE" ]]; then
  return
fi

# User specific environment and startup programs
export LANG=en_US.UTF-8
export CLICOLOR=1
export EDITOR=vim
alias ll='ls -l'
alias hostip='ping -c 1 `hostname` | head -n 1 | grep -Eo "([0-9]+\.){3}[0-9]+"'
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

mkdir -p $HOME/.local
export PREFIX=$HOME/.local

# Add PATHs
for bin in /data/applications/*/bin ; do
  PATH=$bin:$PATH
done

PATH=./node_modules/.bin:$PREFIX/bin:$HOME/bin:$PATH
export PATH

# Optimize NVM loading
node --version >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use stable
fi

ssh-add >/dev/null 2>&1

if [[ -z "$TMUX_DO_NOT_ATTACH" ]]; then
  tmux attach
fi

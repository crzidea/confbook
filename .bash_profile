# .bash_profile

# tmux need alias redefining
alias ll='ls -l'
alias vi='vim'
alias hostip='ping -c 1 `hostname` | head -n 1 | grep -Eo "([0-9]+\.){3}[0-9]+"'
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

export NVM_NODEJS_ORG_MIRROR=http://npm.taobao.org/dist

if [[ -n "$TMUX" && -z "$TMUX_NEED_SOURCE" ]]; then
  # run in tmux
  return
else
  # run on ssh starting or in tmux with $TMUX_NEED_SOURCE

  # User specific environment and startup programs
  #export LC_ALL=en_US.UTF-8
  #export LANG=en_US.UTF-8
  export CLICOLOR=1
  export EDITOR=vim

  mkdir -p $HOME/.local
  export PREFIX=$HOME/.local

  # Add PATHs
  for bin in /data/applications/*/bin ; do
    PATH=$bin:$PATH
  done

  PATH=./node_modules/.bin:$PREFIX/bin:$HOME/bin:$PATH
  export PATH

  tmux ls >/dev/null 2>&1
  TMUX_NO_SESSION=$?
  if [[ 0 -eq $TMUX_NO_SESSION ]]; then
    # session exist
    if [[ -z "$TMUX_DO_NOT_ATTACH" ]]; then
      tmux attach
    fi
    return
  else
    # no session exist

    # Optimize NVM loading
    node --version >/dev/null 2>&1
    if [[ $? -ne 0 && -s "$NVM_DIR/nvm.sh" ]]; then
      # nvm is not compatible with the "PREFIX" environment variable
      prefix_save=$PREFIX
      unset PREFIX
      source "$NVM_DIR/nvm.sh"  # This loads nvm
      nvm use stable >/dev/null
      PREFIX=$prefix_save
    fi

    ssh-add >/dev/null 2>&1
  fi

fi

